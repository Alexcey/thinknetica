class Train
  attr_accessor :count
  attr_reader :speed, :type, :number

  def initialize(number, type, count)
    @number = number
    @type = type
    @count = count
  end

  def speed_up
    self.speed += 10
  end

  def stop 
    self.speed = 0
  end

  def count_up
    self.count += 1 if self.speed == 0
  end

  def count_down
    self.count -= 1 if self.speed == 0
  end

  def get_route(route)
    #Может принимать маршрут следования
    
  end

  def get_route(route)
    #Может принимать маршрут следования
    
  end
end
