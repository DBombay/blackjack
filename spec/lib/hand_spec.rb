require "spec_helper"

RSpec.describe Hand do
  let (:shoe) { Deck.new }
  let (:dealer) { Hand.new( [Card.new("A", "♠").look,Card.new("K", "♠").look]) }

  describe "#getters" do
    it "returns the cards in the dealer's hand when you call dealer.cards" do
      expect(dealer.cards).to eq (["A♠", "K♠"])
    end
  end

  describe "#calculate" do
    let (:ace) { Card.new("A", "♠") }
    let (:king) { Card.new("K", "♠") }
    let (:nine) { Card.new("9", "♠") }
    let (:twentyone) { Hand.new( [ace,king]) }
    let (:nineteen) { Hand.new( [king,nine]) }
    let (:twenty) { Hand.new( [nine,ace]) }
    let (:thirteen) { Hand.new( [ace,ace,ace]) }

    it "returns '21' for an Ace and King" do
      expect(twentyone.calculate).to eq (21)
    end

    it "returns '19' for a King and a nine" do
      expect(nineteen.calculate).to eq (19)
    end

    it "returns  '20' for a nine and an Ace (soft 20)" do
      expect(twenty.calculate).to eq (20)
    end

    it "returns '13' for 3 Aces." do
      expect(thirteen.calculate).to eq (13)
    end

    it "returns a '21' when an Ace is added to a 'soft 20' hand" do
      expect(twenty.calculate).to eq (20)
      twenty.cards << ace
      expect(twenty.calculate).to eq (21)
    end

    it "returns a '19' when a nine is added to a 'soft 20' hand" do
      twenty.cards << nine
      expect(twenty.calculate).to eq (19)
    end

  end
end
