require_relative 'route'
class Train
  attr_accessor :count
  attr_reader :speed, :type, :number, :route

  def initialize(number, type, count)
    @number = number
    @type = type
    @count = count
  end

  def up
    self.speed += 10
  end

  def stop 
    self.speed = 0
  end

  def add
    count += 1 if self.speed == 0
  end

  def remove
    count -= 1 if self.speed == 0 && count > 0
  end

  def route(route)
    @route = route
    @len = 0
  end

  def go
    self.len += 1
  end

  def station
    puts self.route.stations[len - 1] if len > 0
    puts self.route.stations[len]
    puts self.route.stations[len + 1] if len + 1 <= route.stations.length - 1
  end
end
