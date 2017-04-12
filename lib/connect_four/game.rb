require_relative './board.rb'
require_relative './player.rb'

class Game
	
  def initialize p1_name,p2_name
  	@pl1 = Player.new(p1_name,"O")
		@pl2 = Player.new(p2_name,"X",@pl1)
		@pl1.nex = @pl2
		@current = @pl1
    @board = Board.new
    
  end
  def start
          @board.display_board

    until game_over?(@current.nex.mark)
      input =input @current
      @board.update(input,@current.mark)
            @board.display_board

      switch @current

    end
  end

  def input current
    p "#{current.name} enter your play(1-7)"
    input = (STDIN.gets.chomp.to_i) -1
    while !(input.between?(0,7))
      p "enter valid number"
        input = (STDIN.gets.chomp.to_i) -1
      end
      input

  end


  def switch current

  	@current = @current.nex

  end

  def game_over? mark, board=@board
    
     if  board.winner?(mark)
        puts "#{@pl1.name} has won" if (@pl1.mark==mark)
        puts "#{@pl2.name} has won" if (@pl2.mark==mark)
        return true

    elsif board.full? 
      puts "The game is a draw"
      return true
end
    
      return false
  end

end
game = Game.new "villas", "mounaros"
game.start