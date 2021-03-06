require_relative 'auditable'

class Die
  attr_reader :number

  include Auditable

  def initialize
    @number = rand(1..6)
  end

  def roll
    audit
    @number
  end

end
