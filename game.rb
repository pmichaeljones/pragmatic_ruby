require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title, :players

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(name)
      @players << name
  end

  def total_points
    total_points = 0
    @players.each do |x|
      total_points += x.points
    end
    total_points
  end

  def print_stats

    puts "----Health Stats------"
    strong, wimpy = @players.partition { |player| player.strong? }
    puts "#{strong.length} Strong Players:"
    strong.each { |x| puts print_name_and_health(x) }
    puts "---"
    puts "#{wimpy.count} Wimpy Players:"
    wimpy.each { |x| puts print_name_and_health(x) }

    sorted_players = @players.sort # { |player1, player2| player2.score <=> player1.score }
    puts "\n------Final Results------"
    puts "#{@title} High Scores:"
    sorted_players.each do |x|
      puts "#{x.name}".ljust(20,".") + "(#{x.score})"
    end

    puts "\n-------Point Totals-------"
    @players.each do |x|
      puts "\n#{x.name}'s Total Points:"
      puts "#{x.score} grand total points"
    end

    puts "\n----Total Treasure Points-----"
    puts total_points

    puts "\n-----Scores by Player--------"
    @players.each do |x|
      puts "\n#{x.name}'s Point Totals:"
      x.each_found_treasure { |x| puts "#{x.points} total #{x.name} points."}
    end


  end

  def print_name_and_health(x)
    puts "#{x.name} (#{x.health})"
  end

  def treasures
    treasures = TreasureTrove::TREASURES

    puts "There are #{treasures.size} treasures to be found:"
    treasures.each do |x|
      puts "A #{x.name} is worth #{x.points}."
    end
    puts "\n"
  end



  def play(rounds)
    treasures()

    puts "There are #{@players.size} players in #{@title}."

    @players.each do |player|
      puts player
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

end
