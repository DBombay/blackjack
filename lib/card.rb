class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit   # '♦', '♣', '♠', '♥'
  end

  def look
    "" << @rank.to_s + @suit
  end

  def facecard?
    @rank == "K" || @rank == "Q" || @rank == "J"
  end

  def ace?
    @rank == "A"
  end

end
