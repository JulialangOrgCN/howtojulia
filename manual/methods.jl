struct Polynomial{R}
    coeffs::Vector{R}
end

function (p::Polynomial)(x)
    v = p.coeffs[end]
    for i = (length(p.coeffs)-1):-1:1
        v = v*x + p.coeffs[i]
    end
    return v
end

(p::Polynomial)() = p(9)

p = Polynomial([1,9,250])

println(p(3))

println(p())
