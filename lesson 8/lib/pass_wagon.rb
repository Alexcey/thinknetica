# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number, type = ':pass', size)
    super
  end

  def balance(value = 1)
    super
  end
end
