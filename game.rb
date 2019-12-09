require_relative 'player'

class Game

  def initialize 
    @player1 = Player.new('Player1')
    @player2 = Player.new('Player2')
    @players = [@player1, @player2]
    @round = 1
  end
   
  def alive_players
    @players.select{|player| !player.dead?}
  end  

  def game_over?
    alive_players.length == 1
  end

  def next_round
    @round += 1
    @players.reverse!
  end

  def game_status
    puts
    if  alive_players.length != 1
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    else 
      puts "--------------------------Winner--------------------------"
      puts "#{alive_players.first.name} wins with a score of #{alive_players.first.lives} "
    end
  end

  def run
    until game_over?
      
      current_player = @players.first
      first_number = rand(20) +1
      second_number = rand(20) + 1
      answer = first_number + second_number

      puts "------ Round #{@round} --------"

      puts "#{current_player.name}: What does #{first_number} plus #{second_number} equal?"
      print "> "current_player_answer = $stdin.gets.chomp

      if current_player_answer.to_i == answer
        puts "#{current_player.name}: YES! You are correct."
      else
        puts "#{current_player.name}: Seriously? No, go back to school peasant!"
        current_player.lives -= 1
      end

      game_status
      puts
      sleep 0.7
      next_round

    end
  
  end



end