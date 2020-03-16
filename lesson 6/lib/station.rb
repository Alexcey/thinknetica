require_relative 'instance_counter'
require_relative 'validate'

class Station
  include InstanceCounter
  include Validate

  attr_reader :trains, :name
  @@count = 0

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@count += 1
    register_instance
  end

  def add(train)
    trains << train
  end

  def select(type)
    puts trains.select { |train| train.type == type }
  end

  #не тру метод, но для примера сойдет
  def remove(train)
    trains.delete(train)
  end

  def self.all
    @@count
  end

  private

  def validate!
    raise "Имя обязательно" if name.empty?
  end
end
