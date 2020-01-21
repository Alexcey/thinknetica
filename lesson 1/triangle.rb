p "Напиши 1-ую сторону треугольника"
a = gets.chomp.to_i

p "Напиши 2-ую сторону треугольника"
b = gets.chomp.to_i

p "Напиши 3-ую сторону треугольника"
c = gets.chomp.to_i

if a <= 0 or b <= 0 or c <= 0 
  p "Треугольник не существует" 
elsif (a + b < c and a + с < b and b + c < a)
  p "Треугольник не существует"
elsif (a == b and b == c) 
  p "равнобедренный и равносторонний"
elsif (a==b or b==c or a==c) 
  p "треугольник равнобедренный"
else 
  if (a > b and a > c)
    p "треугольник прямоугольным" if (Math.sqrt(b) + Math.sqrt(c) > Math.sqrt(a))
  elsif (b > a and b > a)
    p "треугольник прямоугольным" if (Math.sqrt(a) + Math.sqrt(c) > Math.sqrt(b))
  elsif  (c > a and c > b)
    p "треугольник прямоугольным" if (Math.sqrt(a) + Math.sqrt(b) > Math.sqrt(c))
  else
    p "треугольик обычный"
  end
end