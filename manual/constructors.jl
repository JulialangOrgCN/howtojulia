mutable struct SelfReferential
    o::SelfReferential
    SelfReferential() = (incomplete = new(); incomplete.o = incomplete)
end

alice = SelfReferential()

println(alice === alice)
println(alice === alice.o)
println(alice === alice.o.o)

SelfReferential(o::SelfReferential) = (oo = SelfReferential(); oo.o = o; return oo)

bob = SelfReferential(alice)

println(bob === alice)
println(bob == alice)
println(bob.o == alice)

mutable struct Lazy
    sb
    Lazy(name) = completeit(new(), name)
end

function completeit(o::Lazy, name::AbstractString)
    o.sb = name
    return o
end

cto = Lazy("cto")
println(cto)
println(cto.sb)

# =====OurRational=====

struct OurRational{T<:Integer} <: Real
    numerator::T
    denominator::T
    function OurRational{T}(n::T, d::T) where T<:Integer
        if n == 0 && d == 0
            error("invalid rational: 0//0")
        end
        g = gcd(n, d)
        n = div(n, g)
        d = div(d, g)
        new(n, d)
    end
end

OurRational(n::T, d::T) where {T<:Integer} = OurRational{T}(n, d)

OurRational(n::Integer, d::Integer) = OurRational(promote(n, d)...)

OurRational(n::Integer) = OurRational(n, one(n))

⊘(n::Integer, d::Integer) = OurRational(n, d)

⊘(or::OurRational, k::Integer) = or.numerator ⊘ (or.denominator*k)

⊘(k::Integer, or::OurRational) = (k*or.denominator) ⊘ or.numerator

⊘(k::Complex, m::Real) = complex(real(k) ⊘ m, imag(k) ⊘ m)

⊘(k::Real, m::Complex) = (k*m') ⊘ real(m*m')

function ⊘(p::Complex, q::Complex)
    pq = p*q'
    qq = real(q*q')
    complex(real(pq) ⊘ qq, imag(pq) ⊘ qq)
end

sb = (1+2im) ⊘ (1-2im)
println(typeof(sb))

println(typeof(sb) <: Complex{OurRational})

struct SummedArray{T<:Number,S<:Number}
    data::Vector{T}
    sum::S
    function SummedArray(v::Vector{T}) where T
        S = widen(T)
        new{T,S}(v, sum(S, v))
    end
end

SummedArray(Int32[1,2,3])
# SummedArray(Int32[1,2,3], Int64(6))
# SummedArray(Int32[1,2,3], Int32(6))
