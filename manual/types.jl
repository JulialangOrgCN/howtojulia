# 一个码农的成长例程

struct MaNong
    name::String
    age::UInt8
    skills
    others
end

xiucai = MaNong("xiugai",
0,
["加班", "思路广", "欢乐多", "便宜", "好用", "活好", "话少", "英俊潇洒", "风流倜傥", "诗词若滔滔江水", "文赋如黄河泛滥", "……"],
"www.nagexiucai.com")

mutable struct CodePeasant
    name::String
    age::UInt8
    skills
    github::String
end

cp = CodePeasant("JulialangOrgCN", 1, "致力于Julia编程语言在zh-cn区域的推广【http://julialang.org.cn/】", "julialangorgcn")
println(cp.name)
cp.name = "朱华社区"
println(cp.name)
