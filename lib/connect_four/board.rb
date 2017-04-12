require 'enumerator'
class Board
  attr_accessor :notes

  def initialize 
  	@notes = Array.new(7){Array.new(6,"-")}
  end

  def display_board

      
      (5).downto(0) do |n|
        @notes.each_with_index do |value,i|     
          print "#{value[n]}|"
        end
        puts 
    end
  end

  def update(col,mark)
  	if @notes[col][5] == "-"
  		@notes[col].each_with_index do |n,i|
  			if n=="-"
  				@notes[col][i] = mark
  				return true
  			end
  		end

  	else 
  		return false
    end
  end

  def full?
   @notes.all?{|col| col.all?{|n| n != "-"}}
    
  end

def winner? mark

#check vertical
@notes.each do |col|
col.each_cons(4) do |con|
   if con.uniq.length == 1 && con.uniq.join == mark
 	
   		return true
   	end

 end
end
#check horizontal
	@notes.each_cons(4) do |c|

		(0..5).each do |i|
	 return true if (c.all?{|note|  note[i]==mark})
		end
	end

#check diagonally
	@notes.each_with_index do |col,i|
		col.each_with_index do |value,n|
			 if value == mark
				line = 1

				while  (i+line).between?(0,6) && (n+line).between?(0,5) && @notes[i+line][n+line]==mark
					line+=1
					return true if line==4
				end
				while (i+line).between?(0,6) && (n-line).between?(0,5) &&@notes[i+line][n-line]==mark
					line+=1
					return true if line==4
				end
			end
		end
	end
	
return false

end


end