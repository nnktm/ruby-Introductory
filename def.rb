def introduce(name, age)
    puts "こんにちは、#{name}です。#{age}歳です。"
    if age >= 20
        puts "成人です。"
    else
        puts "未成年です。"
    end
end

introduce("John", 20)
introduce("Jane", 18)

