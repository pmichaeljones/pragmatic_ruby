require_relative 'project'

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


