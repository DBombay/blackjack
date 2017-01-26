require "spec_helper"

RSpec.describe Card do
  let (:card) { Card.new("A","♠") }

  describe "#getters" do

    it "returns A when you call the rank method" do
      expect(card.rank).to eq("A")
    end

    it "returns ♠ when you call the suit method" do
      expect(card.suit).to eq("♠")
    end
  end

  describe "#facecard?" do
    let (:ace) { Card.new("A", "♠") }
    let (:king) { Card.new("K", "♠") }
    let (:nine) { Card.new("9", "♠") }

    it "returns false for an ace" do
      expect(ace.facecard?).to be false
    end

    it "returns false for a 9" do
      expect(nine.facecard?).to be false
    end

    it "returns true for a King" do
      expect(king.facecard?).to be true
    end
  end

  describe "#ace?" do
    let (:ace) { Card.new("A", "♠") }
    let (:king) { Card.new("K", "♠") }
    let (:nine) { Card.new("9", "♠") }

    it "returns false for a King" do
      expect(king.ace?).to be false
    end

    it "returns false for a 9" do
      expect(nine.ace?).to be false
    end

    it "returns true for an ace" do
      expect(ace.ace?).to be true
    end
  end
end
