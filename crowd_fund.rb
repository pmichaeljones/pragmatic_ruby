class Project

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
    "The #{@name} project has $#{@initial} in funding towards a goal of $#{@target}."
  end

end

proj1 = Project.new("New School", 100, 1000)
puts proj1
proj1.add_funds(700)
puts proj1
proj1.sub_funds(500)
puts proj1

