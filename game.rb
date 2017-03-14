require "./questions"
require "./player"

class Game
  LIVES = 3
  def initialize
    @players = []
    1.upto(2) do |num|
      @players.push(Player.new(num))
    end
    @current_player;
    @question = Questions.new
    @cont = 0
    @result = true;
  end


  def print_question
      if @cont > 1
        @cont = 0
      end
      @current_player = @players[@cont];
      puts "Player #{@current_player.name}: #{@question.sum_question}"
      method_answer = @question.answer
      user_answer = gets.chomp
      if method_answer == user_answer.to_i
        @result = true
      else
        @result = false
      end
      @cont += 1
  end

  def score
    puts "P1: #{@players[0].life}/#{Game::LIVES} vs P2: #{@players[1].life}/#{Game::LIVES} "
  end

  def control
    while (@players[0].life && @players[1].life) > 0 do
      self.print_question
      puts @result
      if @result
        puts "Nice job"
      else
        puts "Really?"
        @current_player.life -= 1;
      end
      self.score
      puts "---New Turn---"
    end

    if @players[0].life > 0
      win = @players[0].name
    else
      win = @players[1].name
    end
    puts "Player #{win} wins"
    puts "Game over"
  end

  def players
    puts @players
  end

end

gametest = Game.new

gametest.control
