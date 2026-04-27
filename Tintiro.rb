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

def play()
    cpu_result = ""
    user_result = ""
    for i in 1..3
        cpu_dice = Array.new(3) { rand(1..6) }
        if role(cpu_dice[0], cpu_dice[1], cpu_dice[2]) !="目無し"
            cpu_result = role(cpu_dice[0], cpu_dice[1], cpu_dice[2])
            break
        else
            cpu_result = "目無し"
        end
    end
    for i in 1..3
        user_dice = Array.new(3) { rand(1..6) }
        if role(user_dice[0], user_dice[1], user_dice[2]) !="目無し"
            user_result = role(user_dice[0], user_dice[1], user_dice[2])
            break
        else
            user_result = "目無し"
        end
    
end

play()
