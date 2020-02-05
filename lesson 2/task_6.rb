list = {}
element = {}

# list = {"Фанта"=>{"price"=>50, "number"=>2.0}, "Кола"=>{"price"=>60, "number"=>3.0}}

loop do
  puts 'Напиши название товара'
  name = gets.chomp.to_s
  # name = 'стоп'
  break if name == 'стоп'

  puts 'Напиши цену за единицу'
  price = gets.chomp.to_i

  puts 'Напиши кол-во товара'
  number = gets.chomp.to_f

  list[name] = {}
  list[name]['price'] = price
  list[name]['number'] = number
end

list.each do |key, value|
  sum = value['price'] * value['number']
  puts "#{key} итоговая сумма = #{sum}"
end

sum = 0
list.each do |_key, value|
  sum += value['price'] * value['number']
end
puts "итоговая сумма = #{sum}"
