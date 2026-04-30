#card.rbを読み込む
require_relative "card"

class Deck
  #♠ ♥ ♦ ♣はスペード、ハート、ダイヤ、クラブを表す
  SUITS = %w[♠ ♥ ♦ ♣]
  #A 2 3 4 5 6 7 8 9 10 J Q Kはカードのランクを表す
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

  def initialize
    #SUITSとRANKSを組み合わせてカードを作成
    @cards = SUITS.product(RANKS).map { |s, r| Card.new(s, r) }
    #カードをシャッフル
    @cards.shuffle!
  end

  def draw
    #カードを1枚引く
    @cards.pop
  end
end