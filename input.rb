def introduce()
    print "名前を入力してください："
    name = gets.chomp
    #.chompで改行を削除
    age = nil
    while age.nil?
        print "年齢を入力してください："
        age = gets.chomp
        unless age.match?(/\A\d+\z/)
            #.match?で正規表現を使用
            puts "エラー: 年齢は半角の数字だけで入力してください。"
            age = nil
        end
    end

    print "趣味を入力してください："
    hobby = gets.chomp
    puts "こんにちは、#{name}です。#{age}歳です。趣味は#{hobby}です。"
end


introduce()