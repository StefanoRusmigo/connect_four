describe Player do
	before do
		@pl1 = Player.new("Stef","O")
	end
  context "#initialize" do
  	it "returns name and mark" do
  		expect(@pl1.name).to eq("Stef")
  		expect(@pl1.mark).to eq("O")
  	end
  end
end