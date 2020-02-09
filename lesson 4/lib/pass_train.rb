require_relative 'Train'

class PassengerTrain < Train
  def initialize(number)
    @number = number
    @type = :pass
  end
end