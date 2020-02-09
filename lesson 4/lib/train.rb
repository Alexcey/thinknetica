class Train
  attr_reader :speed, :type, :number, :route

  def initialize(number, type)
    @number = number
    @type = type
    @wagon = []
  end

  def up
    self.speed += 10
  end

  def stop 
    self.speed = 0
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
