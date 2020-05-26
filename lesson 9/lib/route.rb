require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations

  validate :first, :presence
  validate :last, :presence

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [@first, @last]
    validate!
    register_instance
  end

  def add(station)
    stations.insert(-1, station)
  end

  def remove(station)
    stations.delete(station)
  end
end
