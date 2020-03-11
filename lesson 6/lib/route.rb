require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
    register_instance
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
