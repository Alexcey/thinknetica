p "Напиши 1-ый коэффициент"
a = gets.chomp.to_i

p "Напиши 2-ой коэффициент"
b = gets.chomp.to_i

p "Напиши 3-ий коэффициент"
c = gets.chomp.to_i

d = b**2 - 4 * a * c

if d < 0 
  p "корней нет"
elsif d == 0
  p "корень один, d = 0, x1:"
  p -b / (2 * a).to_f
else
  d_root = Math.sqrt(d)
  x1 = (-b + d_root) / (2 * a)
  x2 = (-b - d_root) / (2 * a)
  p "x1: #{x1}"
  p "x2: #{x2}"
end
