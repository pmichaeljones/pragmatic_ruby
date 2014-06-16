class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def <=>(other)
    other.score <=> score
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def add_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s Treasure Chest:\n #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end


  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points}, and score = #{score}."
  end

  def score
    @health +  + points
  end

  def strong?
    health >= 100 ? true : false
  end


end

if __FILE__ == $0

end

