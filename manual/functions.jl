function fuck(male, female)
    println("$(male) fucks $(female) or $(female) fucks $(male)?")
end

fuck("alice", "bob")

kiss(male, female) = "$(male) pushes tongue down $(female)'s throat or $(female) pushes tongue down $(male)'s throat?"

println(kiss("alice", "bob"))

function hypotenuse(a, b)
    a = abs(a)
    b = abs(b)
    if a > b
        r = b/a
        return a*sqrt(1+r*r)
    end
    if b == 0
        return zero(a)
    end
    r = a/b
    return b*sqrt(1+r*r)
end

println(hypotenuse(3, 4))
