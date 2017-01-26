require_relative "Card"

class Hand
  attr_accessor :cards

  def initialize (cards)
    @cards = cards
  end

  def calculate
    score = 0
    aces = 0
    @cards.each do |card|
      if card.facecard?
        score += 10
      elsif card.ace?
        score += 11
        aces += 1
      else
        score += card.rank.to_i
      end
    end
    while score > 21 && aces > 0
      score -= 10
      aces -= 1
    end
    score
  end

end
