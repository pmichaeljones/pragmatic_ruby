projects = []
project1 = ["New School Addition", 150]
projects << project1
project2 = ["Road Signs", 100]
projects << project2
project3 = ["Animal Shelter Repairs", 1000]
projects << project3

projects.each do | name, funding |
  puts "The #{name} project has raised $#{funding}."
end
