macro __LOCATION__(); return QuoteNode(__source__); end

dump(
    @__LOCATION__()
)
