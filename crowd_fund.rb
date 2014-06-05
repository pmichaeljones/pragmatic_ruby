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

proj1 = Project.new("New School", 100, 1000)
proj2 = Project.new("Auditorium", 245, 1235)
proj3 = Project.new("Sidewalk", 12, 12353)

projects = [proj1, proj2, proj3]

projects.each { |p| puts p }






