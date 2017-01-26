require "spec_helper"

describe Deck do
  let(:deck) { Deck.new } # Creates a variable that can be used for tests

  describe "#build_deck" do
    # Remember that the '#' in '#build_deck' means it's a method.
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      expect(deck.review_deck.sort).to_not eq deck.review_deck
      # It is good not just to rely on negative tests like the one we wrote above using "to_not"...
      # ...So we should also assert that, after sorting the deck, it's set up the way we expect. See below.
      expect(deck.review_deck[0..1]).to_not eq [deck.review_deck[0..1]]
    end
  end

  describe "#deal" do
    it "removes 2 cards from the deck when we request 2 cards" do
      expect(deck.cards.size).to eq 52
      deck.deal(2)
      expect(deck.cards.size).to eq 50
    end

    it "removes 1 card from the deck when we request 1 card" do
      expect(deck.cards.size).to eq 52
      deck.deal(1)
      expect(deck.cards.size).to eq 51
    end
  end
end
