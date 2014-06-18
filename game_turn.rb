require_relative 'die'
require_relative 'treasure_trove'


module GameTurn

  def self.take_turn(player)
    die = Die.new

    puts "\n-----------\nIt's #{player.name}'s turn:"

    number = die.number

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

    treasure = TreasureTrove.random
    player.add_treasure(treasure)

  end

end

