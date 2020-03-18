require_relative 'wagon'
class PassengerWagon < Wagon
  attr_reader :number
  
  def initialize(number, type = ':pass')
    super
  end
end
