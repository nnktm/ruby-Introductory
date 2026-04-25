def hitAndBlow()
    answer = (0..9).to_a.sample(4).join
    count = 0
    loop do
        count += 1
        input = nil
        while input.nil?
            print "4桁の数字を当ててください（#{count}回目）："
            input = gets.chomp
            unless input.match?(/\A\d{4}\z/)
                puts "エラー: 4桁の数字を入力してください。"
                input = nil
            end
        end

        if input == answer
            puts "正解です！#{count}回目で当たりました！"
            break
        end

        hit = 0
        blow = 0
        for i in 0...4
            if input[i] == answer[i]
                hit += 1
            else
                for j in 0...4
                    if input[i] == answer[j]
                        blow += 1
                        break
                    end
                end
            end
        end
        puts "hit: #{hit}, blow: #{blow}"
    end
end

hitAndBlow()