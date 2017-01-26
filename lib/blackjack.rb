require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

# Your code here...
class Blackjack
#Create cards that are 1 suit and 1 rank // Done in Card.rb
#Create deck of 52 cards // Done in Deck.rb
#Shuffle the deck // Done in Deck.rb
  attr_accessor :player_playing, :dealer_playing
  attr_reader :player_hand, :dealer_hand, :deck
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new(@deck.deal(2))
    @dealer_hand = Hand.new(@deck.deal(2))
    @player_playing = true
    @dealer_playing = true
  end

  def blackjack?
    # Check for 'Blackjack' for dealer and player
    if dealer_hand.calculate == 21 && player_hand.calculate != 21
      print "\nDealer Blackjack! You lose..."
      @dealer_playing = false
      @player_playing = false
    elsif dealer_hand.calculate != 21 && player_hand.calculate == 21
      print "\nPlayer Blackjack! You win!"
      @dealer_playing = false
      @player_playing = false
    elsif dealer_hand.calculate == 21 && player_hand.calculate == 21
      print "\nYou and the Dealer both have Blackjack. Push..."
      @dealer_playing = false
      @player_playing = false
    else
      print "\nNeither the dealer nor the player has a blackjack.\n"
      @dealer_playing = true
      @player_playing = true
    end
  end

  def intro

    print "\nLet's play Blackjack!\n\n"
    sleep 1.5
    self.blackjack?
    if @player_playing == true && @dealer_playing == true
      sleep 1.2
      print "\nDealer shows a #{dealer_hand.cards[0].look}.\n\n"
      sleep 1.2
      print "You have a #{player_hand.cards[0].look} and #{player_hand.cards[1].look}\n"
      sleep 1.2
    end
  end

  def player_turn
    while @player_playing == true && @dealer_playing == true
      print "Your score is #{player_hand.calculate}.\n\nWould you like to (H)it or (S)tay?\n"
      response = gets.chomp
      if response.upcase == "H"
        player_hand.cards.push((deck.deal(1)).first)
        sleep 0.8
        print "\nYou are dealt #{player_hand.cards.last.look}."
        if player_hand.calculate > 21
          print "\nYou bust. You lose..."
          @player_playing = false
          @dealer_playing = false
        end
      elsif response.upcase == "S"
        print "\n\nYou stay. Your cards are: "
        player_hand.cards.each do |card|
          print " " + card.look
        end
        print "\nYour score is #{player_hand.calculate}"
        @player_playing = false
      else
        raise "You must enter 'H' or 'S'."
      end
    end
  end

  def dealer_turn
    if @player_playing == false && @dealer_playing == true
      print "\nDealer's second card is revealed!"
      sleep 0.8
      print "\nDealer shows #{dealer_hand.cards[0].look} and #{dealer_hand.cards[1].look}."
      while dealer_hand.calculate < 17
        print "\nDealer's score is #{dealer_hand.calculate}!\n\nDealer needs to have at least '17' to Stay."
        dealer_hand.cards.push((deck.deal(1)).first)
        sleep 1.9
        print "\nDealer is dealt #{dealer_hand.cards.last.look}."
        if dealer_hand.calculate > 16 && dealer_hand.calculate <= 21
          @dealer_playing = false
          return
        elsif dealer_hand.calculate > 21
          print "\nDealer has #{dealer_hand.calculate}! Dealer busts! You win!"
          @dealer_playing = false
        else
          return
        end
      end
      print "\n\nDealer's cards are: "
      dealer_hand.cards.each do |card|
        print " " + card.look
      end
      @dealer_playing = false
    end
  end

  def outro
    if player_hand.calculate < 22 && dealer_hand.calculate < 22
      if @player_playing == false && @dealer_playing == false
        print "\n\nYour hand has #{player_hand.calculate} points and the dealer's hand has #{dealer_hand.calculate} points..."
        sleep 1
        if dealer_hand.calculate > player_hand.calculate
          print "\nYou lose..."
        elsif dealer_hand.calculate < player_hand.calculate
          print "\nYou win!"
        else
          print "You and the dealer have the same score. Push, it's a tie!"
        end
      end
    end
  end

  game = Blackjack.new
  game.intro
  game.player_turn
  game.dealer_turn
  game.outro

end
