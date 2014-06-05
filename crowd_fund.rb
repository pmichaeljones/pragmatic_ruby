class Project

  attr_reader :initial, :target
  attr_accessor :name

  def initialize(name, initial, target)
    @name = name
    @initial = initial
    @target = target
  end

  def add_funds(value)
    @initial += value
  end

  def sub_funds(value)
    @initial -= value
  end

  def to_s
    "The #{@name} project has $#{@initial} in funding towards a goal of $#{@target}. #{amount_needed} remains."
  end

  def amount_needed
    @target - @initial
  end
end

class Container

  attr_reader :projects

  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(name)
    @projects << name
  end


  def project_status
    puts "Here's the project roster:"
    @projects.each { |p| puts p }
  end

  def add_funds(name, amount)
    name.add_funds(amount)
    puts "#{amount} was added to the #{name} project."
  end

end


proj1 = Project.new("New School", 100, 1000)
proj2 = Project.new("Auditorium", 100, 1000)
proj3 = Project.new("Sidewalk", 100, 1000)

holder = Container.new("All Projects")

holder.add_project(proj1)
holder.add_project(proj2)
holder.add_project(proj3)

puts holder.projects









