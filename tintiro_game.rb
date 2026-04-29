def role(x, y, z)
    nums = [x, y, z]
    counts = nums.tally

    if counts.size == 1
        return x == 1 ? "ピンゾロ" : "ゾロ目"
    elsif counts.values.sort == [1, 2]
        single = counts.key(1)
        return "#{single}の目"
    elsif counts.values.sort == [1, 1, 1]
        sorted = nums.sort
        return "ヒフミ" if sorted == [1, 2, 3]
        return "シゴロ" if sorted == [4, 5, 6]
        return "目なし"
    end
end

def Win_or_Lose(cpu_result, user_result)
    cpu_score = case cpu_result
    when "ピンゾロ" then 600
    when "ゾロ目" then 500
    when "シゴロ" then 400
    when "目なし" then 200
    when "ヒフミ" then 100
    when /\A([1-6])の目\z/ then 300 + ::Regexp.last_match(1).to_i
    else 0
    end

    user_score = case user_result
    when "ピンゾロ" then 600
    when "ゾロ目" then 500
    when "シゴロ" then 400
    when "目なし" then 200
    when "ヒフミ" then 100
    when /\A([1-6])の目\z/ then 300 + ::Regexp.last_match(1).to_i
    else 0
    end

    return "引き分け" if cpu_score == user_score
    cpu_score > user_score ? "CPUの勝ち" : "あなたの勝ち"
end

def play()
    cpu_result = "目なし"
    user_result = "目なし"
    for i in 1..3
        cpu_dice = Array.new(3) { rand(1..6) }
        if role(cpu_dice[0], cpu_dice[1], cpu_dice[2]) != "目なし"
            cpu_result = role(cpu_dice[0], cpu_dice[1], cpu_dice[2])
            break
        else
            cpu_result = "目なし"
        end
    end
    for i in 1..3
        user_dice = Array.new(3) { rand(1..6) }
        if role(user_dice[0], user_dice[1], user_dice[2]) != "目なし"
            user_result = role(user_dice[0], user_dice[1], user_dice[2])
            break
        else
            user_result = "目なし"
        end
    end
    return cpu_result, user_result
end

def tintiro()
    print " サイコロを振りますか？(y/n): "
    answer = gets.chomp
    if answer == "y"
        cpu_result, user_result = play()
        print"結果を見ますか？(y/n): "
        answer = gets.chomp
        if answer == "y"
            result = Win_or_Lose(cpu_result, user_result)
            puts "CPUの結果: #{cpu_result}"
            puts "あなたの結果: #{user_result}"
            puts "#{result}"
        end
    else
        puts "ゲームを終了します。"
    end
end

tintiro()
