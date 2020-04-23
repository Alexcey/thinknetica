require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(number, size, type = :cargo)
    super
  end
end
