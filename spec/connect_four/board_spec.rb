describe Board do
	let(:board){Board.new}
	
  context "#initialize" do
    it "corect board size" do
    	expect(board.notes.flatten.size).to eql(42)
    	expect(board.notes.size).to eql(7)
    	expect(board.notes.all? {|n| n.size==6 }).to be true
    	expect(board.notes.all?{|n| n.all?{|x| x=="-"} }).to be true
    end
  end

  context "#update" do
    before do
      board.update(1,"O")
      board.update(0,"O")
      board.update(1,"O")
      board.update(3,"O")
      board.update(0,"X")
      board.update(1,"O")
      board.update(1,"O")
      board.update(1,"O")
      board.update(1,"O")
    end
      it "updates a value in a col" do
        expect(board.notes[0][0]).to eq("O")
        expect(board.notes[0][1]).to eq('X')
        expect(board.notes[3][0]).to eq('O')
        expect(board.notes[1].all?{|n| n!="-"}).to be true
     end

     it "checks if col is full" do
      expect(board.update(1,'O')).to be false
      expect(board.update(2,'X')).to be true
     end
  end

  context "#full?" do
    before do
      board.notes.map!{|col| col.map!{|n| n="O"}}
    end
    it "returns true when board is full" do
      expect(board.full?).to be true
    end
  end

  context "#winner?" do
    it "checks when no winner" do
      expect(board.winner?("O")).to be false

        board.notes.map!.with_index do |col,n|
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
      expect(board.winner?("X")).to be false
      expect(board.winner?("O")).to be false



    end
    it "checks horizontal" do
      
       board.update(0,"O")
       board.update(1,"O")
       board.update(2,"O")
       board.update(3,"O")
        
      expect(board.winner?("O")).to be true
      expect(board.winner?("x")).to be false


    end

    it "checks vertical" do
      
       board.update(0,"O")
       board.update(0,"O")
       board.update(0,"O")
       board.update(0,"O")
        
     expect(board.winner?"O").to be true
      expect(board.winner?("X")).to be false

    end
  it "checks diagonal" do
    
       board.update(0,"O")
       board.update(1,"X")
       board.update(1,"O")
       board.update(2,"X")
       board.update(2,"X")
       board.update(2,"O")
       board.update(3,"X")
       board.update(3,"X")
       board.update(3,"X")
       board.update(3,"O")


     expect(board.winner?"O").to be true
     expect(board.winner?"X").to be false


   end

   it "checks randomly" do
        board.update(4,"O")
       board.update(4,"O")
       board.update(5,"X")
       board.update(5,"O")
       board.update(5,"O")
       board.update(6,"X")
       board.update(6,"O")

        expect(board.winner?"O").to be false
     expect(board.winner?"X").to be false

   end



  end



end

