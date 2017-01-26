require_relative "Card"

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank,suit)
      end
    end
    cards.shuffle!
  end

  def deal(num)
    cards.pop(num)
  end

  def review_deck
    deck = Array.new
    @cards.each do |card|
      deck << "#{card.rank}#{card.suit}"
    end
    deck
  end

end
