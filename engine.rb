# engine.rb


require "./deck"
require "./player"

class Engine

  attr_accessor :winning_pot


  def starting_info
    clear_terminal
    puts "Welcome to the Game of WAR! Please enter your name where you're ready to begin." # put rules here later
  end

  def start_game(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @winning_pot = []
    play
  end

  def play

    while continue_game?
      normal_turn
    end

    if !continue_game?
      # ending game info
    end

  end


  def normal_turn

    player_one_card = @player_one.flip_one_card
    player_two_card = @player_two.flip_one_card

    @winning_pot << player_one_card
    @winning_pot << player_two_card


    puts @player_one.name + " draws the " + read_card(player_one_card)
    puts @player_two.name + " draws the " + read_card(player_two_card)

    evaluate(player_one_card, player_two_card)

  end

  def war
    puts "WAR!!! Each player places 1 card down and one card up!"
    puts "1 down!"
    @winning_pot << @player_one.flip_one_card
    @winning_pot << @player_two.flip_one_card

    display_cards_left
    ##gets


    player_one_card = @player_one.flip_one_card
    player_two_card = @player_two.flip_one_card

    puts 'Now this one is face up!'

    puts @player_one.name + " draws the " + read_card(player_one_card)
    puts @player_two.name + " draws the " + read_card(player_two_card)

    display_cards_left
    ##gets

    @winning_pot << player_one_card
    @winning_pot << player_two_card

    evaluate(player_one_card, player_two_card)

  end

  def evaluate(card_1, card_2)

    if card_1[:worth] > card_2[:worth]
      # player one wins
      puts "#{@player_one.name} wins!"
      @winning_pot.each do |card|
        @player_one.take_winning_cards(card)
      end
      @winning_pot = []
      # display_cards_left
      display_cards_left
      ##gets
      clear_terminal
    elsif card_2[:worth] > card_1[:worth]
      # player two wins
      puts "#{@player_two.name} wins!"
      @winning_pot.each do |card|
        @player_two.take_winning_cards(card)
      end
      @winning_pot = []
      display_cards_left
      # display_cards_left
      ##gets
      clear_terminal
    else
      war
    end


  end

  def display_cards_left


    puts "~~~ #{@player_one.name} [#{@player_one.cards_left}] | #{@player_two.name} [#{@player_two.cards_left}]  ~~~"

  end

  def read_card(card_hash)
    "#{card_hash[:name]} of #{card_hash[:suit]}"
  end

  def continue_game?
    @player_one.cards_left > 0 && @player_two.cards_left > 0 ? true : false
  end

  def clear_terminal
    system 'clear'
  end

  def end_game_announcement
    clear_terminal
    if @player_one.cards_left == 0
      puts 'Congradulations Computer, you Win!!'
    else
      puts "Congradulations #{@player_one.name}, you Win!!"
    end

  end

end


## START THE GAME ##
engine = Engine.new
engine.starting_info

deck = Deck.new
deck_one, deck_two = deck.split_deck

player_one = Player.new(deck_one, gets.chomp)
player_two = Player.new(deck_two, 'Computer')


engine.start_game(player_one, player_two)
