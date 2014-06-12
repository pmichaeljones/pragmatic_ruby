require_relative 'treasure_trove'

describe Treasure do

  before do
    @treasure = Treasure.new(:hammer, 50)
  end

  it "has a name attribute" do
    expect(@treasure.name).to eq(:hammer)
  end

  it "has a points attribute" do
    expect(@treasure.points).to eq(50)
  end

end
