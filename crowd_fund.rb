require_relative 'project'
require_relative 'container'

proj1 = Project.new("New School", 100, 1000)
proj2 = Project.new("Auditorium", 100, 1000)
proj3 = Project.new("Sidewalk", 100, 1000)

holder = Container.new("All Projects")

holder.add_project(proj1)
holder.add_project(proj2)
holder.add_project(proj3)

puts holder.projects









