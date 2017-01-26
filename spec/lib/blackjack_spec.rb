require "spec_helper"

#For these tests to work correctly, the @cards attribute in Hand.rb *must*
#be set to attr_accessor

RSpec.describe Blackjack do
  let (:game) { Blackjack.new}

  describe "#blackjack?" do
    let (:ace) {Card.new("A", "♠")}
    let (:king) {Card.new("K", "♠")}

    it "Declares Blackjack for the dealer.
    \nAlso terminates the code by turning
    \nthe @player_playing and @dealer_playing
    \nflags to 'false'" do
      game.dealer_hand.cards = [ace, king]
      game.player_hand.cards = [king, king]
      game.intro
      expect(game.player_playing).to eq false
      expect(game.dealer_playing).to eq false
    end

    it "Declares Blackjack for the player.
    \nAlso terminates the code by turning
    \nthe @player_playing and @dealer_playing
    \nflags to 'false'" do
      game.dealer_hand.cards = [king, king]
      game.player_hand.cards = [ace, king]
      game.intro
      expect(game.player_playing).to eq false
      expect(game.dealer_playing).to eq false
    end

    it "Declares a push if the player and dealer_hand
    \n both have blackjack. Terminates the code." do
      game.dealer_hand.cards = [king, ace]
      game.player_hand.cards = [king, ace]
      game.intro
      expect(game.player_playing).to eq false
      expect(game.dealer_playing).to eq false
    end

    it "doesn't stop the game if neither player has blackjack" do
      game.dealer_hand.cards = [king, king]
      game.player_hand.cards = [king, king]
      game.intro
      expect(game.player_playing).to eq true
      expect(game.dealer_playing).to eq true
    end
  end

  describe "#player_turn" do
    let (:ace) { Card.new("A", "♠") }
    let (:king) { Card.new("K", "♠") }
    let (:nine) { Card.new("9", "♠") }
  end
end
