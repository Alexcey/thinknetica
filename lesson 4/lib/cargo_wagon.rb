require_relative 'wagon'
class CargoWagon < Wagon
  attr_reader :number
  
  def initialize(number, type = ':cargo')
    super
  end
end
