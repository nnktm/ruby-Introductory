class Card
    attr_reader :suit, :rank

    def initialize(suit, rank)
        @suit = suit
        @rank = rank
    end

    def value
        if rank == "A"
            return 11
        elsif %w[J Q K].include?(rank)
            return 10
        else
            return rank.to_i
        end
    end

    def to_s
        return "#{suit}#{rank}"
    end
end