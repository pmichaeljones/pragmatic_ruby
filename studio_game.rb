require_relative 'game'
require_relative 'player'

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

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

















