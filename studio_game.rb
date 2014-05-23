player1 = "larry"
health1 = 60

player2 = "curly"
health2 = 125

player3 = "moe"
health3 = 100

player4 = "shemp"
health4 = 90

puts "#{player1.capitalize}'s health is #{health1}"

puts "#{player2.upcase}'s health is #{health2}"

puts "#{player3.capitalize} has a health of #{health3}".center(50,'*')

puts "#{player4.capitalize.ljust(25,'.')}#{health4} health"

current_time = Time.new

puts "The game started at #{current_time.strftime('%A %m/%d/%y at %I:%M%p')}"