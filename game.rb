require './player'
require './question'

class Game 

  # constructor
  def initialize

    # initializing players and round
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player2,@player1]

    @round = 1
  end

  # define next round/ number of rounds
  def next_round
    if @round > 1
    puts "----- NEW TURN -----"
    end
    # next round
    @round += 1
    @players.rotate!
  end

  # define game status/ current hp
  def current_hp
    puts "P1: #{@player1.hp}/3 vs P2: #{@player2.hp}/3"
  end

  # define get array of remaining players (not dead)
  def remaining_player
    @players.select {|player| !player.dead?}
  end

  # define display winner
  def display_winner
    puts "#{remaining_player.first.name} wins with a score of #{remaining_player.first.hp}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end 
  
  # define check if a player is eliminated
  def game_over
    remaining_player.count == 1
  end
  
  # define main game loop
  def play
    #keep running this loop till game over. could also do while both lives > 0 instead of definding game over
    until game_over do
      
      next_round
      
      # setting current player
      current_player = @players[0]
  
      # player is asked question via chomps
      new_question = Question.new
      puts "#{current_player.name}: What does #{new_question.num_1} plus #{new_question.num_2} equal?"
      answer = $stdin.gets.chomp.to_i
      if answer == new_question.answer
        puts "#{current_player.name}: YES! You are correct."
      else 
        puts "#{current_player.name}: Seriously? No!"
        current_player.hp_loss
      end
      
      # show game status
      current_hp

      #could add sleep (sleep 1) to add wait time between rounds

    end
    # show winner once above until loop is done
    display_winner

  end

end