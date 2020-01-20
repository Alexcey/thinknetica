p "Напиши свое имя"
name = gets.chomp

p "Напиши свой вес"
weight = gets.chomp.to_i

ideal = ((weight - 110)*1.15).to_i

if ideal > 0 
  p "Твой идельный вес:  #{ideal}"
else 
  p "Ваш вес уже оптимальный"
end