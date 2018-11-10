module Macros
import Base.@time

macro __LOCATION__(); return QuoteNode(__source__); end

dump(
    @__LOCATION__()
)

time() = println("macros")

@time time()

end
