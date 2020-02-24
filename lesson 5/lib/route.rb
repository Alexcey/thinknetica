class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add(station)
    #stations.insert(-1, station)
    stations.insert(stations.length - 1, station)
  end

  #не тру метод, но для примера сойдет
  def remove(station)
    stations.delete(station)
  end
end
