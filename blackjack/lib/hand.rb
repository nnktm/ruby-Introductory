class Hand
    #cardsを読み込む
    attr_reader :cards
  
    def initialize
      #cardsを空の配列で初期化
      @cards = []
    end
  
    def add_card(card)
      #cardsにcardを追加
      @cards << card
    end
    
    def score
      #cardsのvalueを合計
      total = @cards.sum(&:value)
      #cardsのrankがAのカードの数
      aces = @cards.count { |c| c.rank == "A" }
      #totalが21を超えている場合は、Aのカードを1枚ずつ引いてtotalを21以下にする
  
      while total > 21 && aces > 0
        total -= 10
        aces -= 1
      end
  
      total
    end
  
    def busted?
      #totalが21を超えている場合は、trueを返す
      score > 21
    end
  end