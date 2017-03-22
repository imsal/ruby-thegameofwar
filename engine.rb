# engine.rb


require "./deck"
require "./player"

class Engine


  def starting_info
    puts "Welcome to the Game of WAR! Please enter your name where you're ready to begin." # put rules here later
  end

  def start_game(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    play
  end

  def play

    if continue_game?
      ## contineu Game
      normal_turn
    else
      ## end Game
    end

  end


  def normal_turn
    player_one_card = @player_one.flip_one_card
    player_two_card = @player_two.flip_one_card

    puts @player_one.name + " draws the " + read_card(player_one_card)
    puts @player_two.name + " draws the " + read_card(player_two_card)

    if player_one_card[:worth] > player_two_card[:worth]
      # player one wins
      puts "#{@player_one.name} wins!"
      @player_one.take_winning_cards(player_one_card, player_two_card)
      display_cards_left
    elsif player_two_card[:worth] > player_one_card[:worth]
      # player two wins
      puts "#{@player_two.name} wins!"
      @player_two.take_winning_cards(player_one_card, player_two_card)
      display_cards_left
    else
      war(player_one_card, player_two_card)
    end

  end

  def war(*cards_held)

  end

  def display_cards_left

    puts "**********| #{@player_one.name} #{@player_one.cards_left} Cards Left | **********"
    puts "**********| #{@player_two.name} #{@player_two.cards_left} Cards Left | **********"

  end



  def read_card(card_hash)
    "#{card_hash[:name]} of #{card_hash[:suit]}"
  end

  def continue_game?
    @player_one.cards_left > 0 && @player_two.cards_left > 0 ? true : false
  end

  def check_game_status
=begin
    if @player_one.cards_left == 0
      # player two wins
    elsif @player_two.cards_left == 0
      # player one wins
    else
      # continue the game
    end
=end
  end

end


## START THE GAME ##
engine = Engine.new
engine.starting_info

deck = Deck.new
deck_one, deck_two = deck.split_deck

player_one = Player.new(deck_one, 'Sal') # change name via gets.chomp later
player_two = Player.new(deck_two, 'Computer')


engine.start_game(player_one, player_two)
