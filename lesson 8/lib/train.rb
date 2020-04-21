# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validate'

class Train
  include Manufacturer
  include InstanceCounter
  include Validate
  attr_reader :speed, :type, :number, :route
  attr_accessor :wagons

  NUMBER_FORMAT = /^[\w\d]{3}-?[\w\d]{2}$/i.freeze

  @@trains = {}
  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @speed = 0
    @wagons = []
    @@trains[number] = self
    register_instance
  end

  def self.find(number)
    @@trains[number]
  end

  def wagons_block
    @wagons.each { |wagon| yield(wagon) }
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
    puts route.stations[len - 1] if len > 0
    puts route.stations[len]
    puts route.stations[len + 1] if len + 1 <= route.stations.length - 1
  end

  protected

  def validate!
    raise 'Номер обязательно' if number.empty?
    raise "Неверный формат номера #{number}" if number !~ NUMBER_FORMAT
  end

  def up!
    @speed += 10
  end

  def stop!
    @speed = 0
  end
end
