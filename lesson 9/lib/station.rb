require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  attr_reader :trains, :name
  @@count = 0

  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, /[\d\w]+/

  def initialize(_name)
    @name = names
    validate!
    @trains = []
    @@count += 1
    register_instance
  end

  def trains_block
    @trains.each { |train| yield(train) }
  end

  def add(train)
    trains << train
  end

  def select(type)
    trains.select { |train| train.type == type }
  end

  def remove(train)
    trains.delete(train)
  end

  def self.all
    @@count
  end

  private

  def validate!
    raise 'Имя обязательно' if name.empty?
  end
end
