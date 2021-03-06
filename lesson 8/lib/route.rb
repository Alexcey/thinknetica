require_relative 'instance_counter'
require_relative 'validate'

class Route
  include InstanceCounter
  include Validate

  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
    validate!
    register_instance
  end

  def add(station)
    stations.insert(-1, station)
  end

  def remove(station)
    stations.delete(station)
  end

  private

  def validate!
    raise 'Начальная станция обязательная' if stations.first.name.empty?
    raise 'Конечная станция обязательная' if stations.last.name.empty?
  end
end
