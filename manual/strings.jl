println("正则表达式")

pattern = r"^\s*(?:#|$)"

matched = match(pattern, "# a comment")

if matched == nothing
    println("not a comment")
else
    println("blank or a comment")
end
