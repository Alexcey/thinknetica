require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :speed, :type, :number, :route
  attr_accessor :wagons

  @@trains = {}

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    @@trains[number] = self
    register_instance
  end

  def self.find(number)
    @@trains[number]
  end

  def up
    up!
  end

  def stop 
    stop!
  end

  def add_wagon(wagon)
    wagons.push(wagon)
  end

  def remove_wagon(wagon)
    wagons.delete(wagon)
  end

  def add_route(route)
    @route = route
    @length = 0
  end

  def go
    self.length += 1
  end

  def station
    puts self.route.stations[len - 1] if len > 0
    puts self.route.stations[len]
    puts self.route.stations[len + 1] if len + 1 <= route.stations.length - 1
  end

  protected 

  def up!
    @speed += 10
  end

  def stop!
    @speed = 0
  end
end
