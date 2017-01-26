require "spec_helper"

RSpec.describe Blackjack do
  let (:game) { Blackjack.new}

  describe "#blackjack?" do
    let (:game) {Blackjack.new}
    let (:ace) {Card.new("A", "♠")}
    let (:king) {Card.new("K", "♠")}

    it "Declares Blackjack for the dealer and tells the player they lose" do
      game.dealer_hand.cards = [ace, king]
      game.player_hand.cards = [king, king]
      expect(game.blackjack?).to eq("Dealer Blackjack! You lose...")
    end

  end
end
