require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number)
    @number = number
    @type = :pass
  end
end