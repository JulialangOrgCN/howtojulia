# 某个时期三国态势

module 魏
  king = "曹操" # 这个king模块魏的全局变量
  prince = "曹丕"
end

module 蜀
  king = "刘备"
  module 荆
    commander = "关羽"
  end
  cmdrJing = 荆.commander # 直接可访问到嵌套模块（全局作用域）荆（并通过合法的点注解访问荆模块的commander变量
  import ..魏 # 导入模块魏
  enemy = 魏.king # 可通过合法的点注解访问魏模块的king变量
end

module 吴
  king = "孙权"
  partner = prince # 未定义prince符号（UndefVarError: prince not defined）
  brotherInLaw = 蜀.king # 未定义蜀符号（更不用提其king符号）（UndefVarError: 蜀 not defined）
end

module 汉
  emperor = "刘协"
  import ..蜀
  蜀.king *= "：皇叔-左将军-豫州牧" # 不能修改别的模块的变量（ERROR: LoadError: cannot assign variables in other modules）
  import ..魏
  魏.king *= "：丞相-冀州牧" # 不能修改别的模块的变量（ERROR: LoadError: cannot assign variables in other modules）
  import ..吴
  吴.king *= "：车骑将军-徐州牧" # 不能修改别的模块的变量（ERROR: LoadError: cannot assign variables in other modules）
end
