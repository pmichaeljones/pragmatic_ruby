require_relative 'player'
require_relative 'treasure_trove'

describe Player do
  before do
    $stdout = StringIO.new
    @player = Player.new("larry", 125)

  end

  it "yields each found treasure and its total points" do
  @player.add_treasure(Treasure.new(:skillet, 100))
  @player.add_treasure(Treasure.new(:skillet, 100))
  @player.add_treasure(Treasure.new(:hammer, 50))
  @player.add_treasure(Treasure.new(:bottle, 5))
  @player.add_treasure(Treasure.new(:bottle, 5))
  @player.add_treasure(Treasure.new(:bottle, 5))
  @player.add_treasure(Treasure.new(:bottle, 5))
  @player.add_treasure(Treasure.new(:bottle, 5))

  yielded = []
  @player.each_found_treasure do |treasure|
    yielded << treasure
  end

  yielded.should == [
    Treasure.new(:skillet, 200),
    Treasure.new(:hammer, 50),
    Treasure.new(:bottle, 25)
  ]

end

  it "computes points as the sum of all treasure points" do
    expect(@player.points).to eq(0)

    @player.add_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(50)

    @player.add_treasure(Treasure.new(:crowbar, 400))

    expect(@player.points).to eq(450)

    @player.add_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(500)

  end


  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(125)
  end


  it "has a string representation" do
    @player.add_treasure(Treasure.new(:hammer, 50))
    @player.add_treasure(Treasure.new(:hammer, 50))

    expect(@player.to_s).to eq("I'm Larry with a health = 125, points = 100, and score = 225.")
  end

  it "computes a score as the sum of its health and length of name" do
    @player.add_treasure(Treasure.new(:hammer, 50))
    @player.add_treasure(Treasure.new(:hammer, 50))

    expect(@player.score).to eq(225)

  end

  it "increases health by 15 when w00ted" do
    initial_health = @player.health
    @player.w00t
    expect(@player.health).to eq(initial_health + 15)
  end


  it "decreases health by 10 when blammed" do
    initial_health = @player.health
    @player.blam
    expect(@player.health).to eq(initial_health - 10)
  end

  context "with an initial health greater than 100" do
    before do
      @player = Player.new("Bob", 150)
    end

    it "is a strong" do
      expect(@player).to be_strong
    end

  end


  context "with an initial health of less than 100" do
    before do
      @player = Player.new("Jim", 50)
    end

    it "is weak" do
      expect(@player).not_to be_strong
    end

  end


end