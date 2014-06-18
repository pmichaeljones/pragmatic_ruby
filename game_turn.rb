require_relative 'die'
require_relative 'treasure_trove'
require_relative 'loaded_die'


module GameTurn

  def self.take_turn(player)
    die = Die.new
    treasure = TreasureTrove.random


    puts "\n-----------\nIt's #{player.name}'s turn:"

    number = die.roll

    case number
    when 1, 2
      puts "#{player.name} got a #{number}."
      player.blam
    when 3, 4
      puts "#{player.name} got a #{number}."
      puts "#{player.name} was skipped."
    when 5, 6
      puts "#{player.name} got a #{number}."
      player.w00t
    end

    player.add_treasure(treasure)

  end

end

