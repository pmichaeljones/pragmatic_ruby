require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  attr_reader :title, :players

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(name)
      @players << name
  end

  def print_stats

    sorted_players = @players.sort { |player1, player2| player2.score <=> player1.score }

    puts "------Game Stats------"
    strong, wimpy = @players.partition { |player| player.strong? }
    puts "#{strong.length} Strong Players:"
    strong.each { |x| puts "#{x.name} (#{x.health})" }
    puts "---"
    puts "#{wimpy.count} Wimpy Players:"
    wimpy.each { |x| puts "#{x.name} (#{x.health})" }
    puts "\n------Final Results------"
    puts "#{@title} High Scores:"
    sorted_players.each do |x|
      puts "#{x.name}".ljust(20,".") + "(#{x.score})"
    end


  end


  def play(rounds)
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
