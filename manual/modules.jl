module MyType

using Lib

using BigLib: thingx, thingy

import Base.show

export MyType, fuck

struct MyType
    x
end

bar(n) = 2n

fuck(mt::MyType) = bar(mt.x) + 9527

show(io::IO, mt::MyType) = print(io, "1314")

end