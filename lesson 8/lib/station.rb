# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validate'

class Station
  include InstanceCounter
  include Validate

  attr_reader :trains, :name
  @@count = 0

  def initialize(name)
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
    puts trains.select { |train| train.type == type }
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
