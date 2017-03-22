# player.rb

class Player

  attr_accessor :deck, :name

  def initialize(deck, name)
    @deck = deck
    @name = name
  end

  def name
    @name
  end

  def deck
    @deck
  end

  def cards_left
    @deck.count
  end

  def flip_one_card
    @deck.shift
  end

  def take_winning_cards(*cards)
    @deck.push(*cards)
  end


end
