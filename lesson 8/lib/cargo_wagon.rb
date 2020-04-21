# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(number, type = :cargo, size)
    super
  end
end
