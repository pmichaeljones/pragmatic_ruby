require_relative 'player'

describe Player do
  before do
    $stdout = StringIO.new
    @player = Player.new("larry", 125)

  end


  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(125)
  end


  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Larry with a health of 125 and a score of #{@player.score}.")
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(@player.health + @player.name.length)
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