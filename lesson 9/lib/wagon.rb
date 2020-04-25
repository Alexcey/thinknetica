require_relative 'manufacturer'

class Wagon
  include Manufacturer
  attr_reader :number, :balance, :type, :size

  def initialize(number, type, size)
    @number = number
    @type = type
    @size = size
    @balance = 0
  end

  def change_place(value)
    @balance + value <= @size ? @balance += value : (puts 'Сумма остатка и значения превышает размер')
  end

  def left
    @size - @balance
  end
end
