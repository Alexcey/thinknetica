require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    @number = number
    @type = :cargo
  end
end
