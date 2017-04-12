describe Game do 
	before do
		@game = Game.new("stef","jon")
		@board = Board.new
	end

  context "#switch" do
  	it "swiches players" do
      @game.switch(@game.instance_variable_get(:@pl1))
  		expect(@game.instance_variable_get(:@current)).to eq(@game.instance_variable_get(:@pl2))
  	end
  end
  context "#game_over?" do
  	it "checks if draw" do
  		 @board.notes.map!.with_index do |col,n|
  			col.map!.with_index do |mark,i|
  				if n%2 == 0
  					unless i==2||i==3
  						mark = "O"
  					else mark = "X"
  					end
  				else
  					unless i==3||i==2
  						mark = "X"
  					else mark = "O"
  					end
  				end
  			end
  		end
  	
	  expect(@game.game_over?"O",@board).to be true
  	end
  	it "checks if O won" do
  		@board.update(0,"O")
       @board.update(0,"O")
       @board.update(0,"O")
       @board.update(0,"O")
	  expect(@game.game_over?"O",@board).to be true
	  expect(@game.game_over?"x",@board).to be false
  	end
  	it "check if X won" do 
  		@board.update(0,"X")
       @board.update(1,"X")
       @board.update(2,"X")
       @board.update(3,"X")
       expect(@game.game_over?"X",@board).to be true
	  expect(@game.game_over?"O",@board).to be false
  	end
  	it "checks when noone won" do
   		expect(@game.game_over?"X",@board).to be false
	  expect(@game.game_over?"O",@board).to be false  	
	end


  end


end