p "Напиши свое имя"
name = gets.chomp.to_s

p "Напиши свой вес"
weight = gets.chomp.to_i

ideal = (weight - 110) * 1.15

if weight <= 0
  p "Ввели неправильные данные" 
elsif ideal > 0 
  p "Твой идельный вес: #{ideal}"
else 
  p "Ваш вес уже оптимальный"
end
