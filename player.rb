require_relative 'treasure_trove'
require_relative 'playable'

class Player
  attr_reader :health
  attr_accessor :name

  include Playable

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def <=>(other)
    other.score <=> score
  end

  def add_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s Treasure Chest:\n #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      new_treasure = Treasure.new(name, points)
      yield(new_treasure)
    end

  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points}, and score = #{score}."
  end

  def score
    @health + points
  end

end

if __FILE__ == $0

end

