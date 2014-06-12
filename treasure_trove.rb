Treasure = Struct.new(:name, :points)

module TreasureTrove
  TREASURES = []

  list = {
    :pie => 5,
    :bottle => 25,
    :hammer => 50,
    :skillet => 100,
    :broomstick => 200,
    :crowbar => 400
  }

  list.each do |name,point|
    x = Treasure.new(name, point)
    TREASURES << x
  end

  def self.random
    TREASURES.sample
  end


end

