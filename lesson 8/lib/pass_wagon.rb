# frozen_string_literal: true

require_relative 'wagon'
class PassengerWagon < Wagon
  def initialize(number, type = ':pass', size)
    super
  end

  def set_balance(value = 1)
    super
  end
end
