# deck.rb

class Deck
  attr_accessor :deck

  def initialize
    create_deck
    shuffle_deck
  end


  def create_deck
    suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    deck = []

    values.each_with_index do |value, index|
      suits.each do |suit|
        card_hash = { name: "#{value}", suit: suit, worth: index+2 }
        deck.push(card_hash)
      end
    end

    @deck = deck # card is accessed by deck[index][key]
  end

  def shuffle_deck
    @deck = deck.shuffle
  end

  def split_deck
    deck_one = []
    deck_two = []

    @deck.each_with_index do |card, index|
      if index % 2 == 0
        deck_one.push(card)
      else
        deck_two.push(card)
      end
    end

    return deck_one, deck_two
  end



end
