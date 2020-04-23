require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number, size, type = ':pass')
    super
  end

  def balance(value = 1)
    super
  end
end
