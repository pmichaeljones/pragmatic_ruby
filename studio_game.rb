require_relative 'game'
require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")
clumsy = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(clumsy)
berserk = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserk)

loop do
  puts "\nHow Many rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when  /^\d+$/
    knuckleheads.play(answer.to_i)
  when "quit", "exit"
    knuckleheads.print_stats
    break
  else
    puts "Number or 'quit' please."
  end
end

knuckleheads.save_high_scores

















