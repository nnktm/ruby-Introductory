require_relative "lib/blackjack_game"

game = BlackjackGame.new
game.initial_deal

loop do
  puts "あなたの手札: #{game.player_hand.cards.join(", ")} (#{game.player_hand.score})"
  puts "ディーラーの見えてるカード: #{game.dealer_hand.cards.first}"

  #プレイヤーの手札がバストしている場合は、ループを抜ける
  if game.player_hand.busted?
    break
  end
  print "Hit? (y/n): "
  input = gets.chomp.downcase
  if input != "y"
    break
  end
  game.player_hit
end

unless game.player_hand.busted?
  dealer_drawn_cards = game.dealer_turn
  dealer_drawn_cards.each do |card|
    puts "ディーラーはHitしました: #{card}"
  end
end

puts "----- 結果 -----"
puts "あなた: #{game.player_hand.cards.join(", ")} (#{game.player_hand.score})"
puts "ディーラー: #{game.dealer_hand.cards.join(", ")} (#{game.dealer_hand.score})"
puts "判定: #{game.result}"