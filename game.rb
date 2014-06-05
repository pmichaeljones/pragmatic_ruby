require_relative 'player'

class Game
  attr_reader :title

  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(name)
    name.w00t
    puts name
    @players << name
  end

  def play
    puts "There are #{@players.size} players in #{@name}."
    @players.each do |p|
      puts p
    end

    @players.each do |p|
      p.blam
      2.times { p.w00t }
      puts p
    end
  end

end
