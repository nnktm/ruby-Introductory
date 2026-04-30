require_relative "deck"
require_relative "hand"

class BlackjackGame
  attr_reader :player_hand, :dealer_hand

  def initialize
    #初期化する
    @deck = Deck.new
    #プレイヤーの手札を初期化
    @player_hand = Hand.new
    #ディーラーの手札を初期化
    @dealer_hand = Hand.new
  end

  def initial_deal
    #2枚のカードを引く
    2.times do
      #プレイヤーの手札にカードを追加
      @player_hand.add_card(@deck.draw)
      #ディーラーの手札にカードを追加
      @dealer_hand.add_card(@deck.draw)
    end
  end

  def player_hit
    #プレイヤーの手札にカードを追加
    @player_hand.add_card(@deck.draw)
  end

  def dealer_turn
    drawn_cards = []
    #ディーラーの手札が17未満ならカードを引き続ける
    while @dealer_hand.score < 17
      card = @deck.draw
      @dealer_hand.add_card(card)
      drawn_cards << card
    end
    drawn_cards
  end

  def result
    return :player_bust if @player_hand.busted?
    return :dealer_bust if @dealer_hand.busted?
    return :player_win if @player_hand.score > @dealer_hand.score
    return :dealer_win if @player_hand.score < @dealer_hand.score
    :draw
  end
end