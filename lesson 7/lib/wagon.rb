require_relative 'manufacturer'

class Wagon 
  include Manufacturer

  def initialize(number, type)
    @number = number
    @type = type
  end
end
