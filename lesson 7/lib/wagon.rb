require_relative 'manufacturer'

class Wagon 
  include Manufacturer
  attr_reader :number, :balance

  def initialize(number, type, size)
    @number = number
    @type = type
    @size = size
    @balance = 0
  end

  def set_balance(value)
    @balance + value <= @size ? @balance += value : (puts "Сумма остатка и значения превышает размер")
  end

  def get_balance
    @size - @balance
  end
end
