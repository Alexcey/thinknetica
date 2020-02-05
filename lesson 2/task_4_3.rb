# task4_3
fibonacci_numbers = [0, 1]
i = 1

while true
  i += 1
  number = fibonacci_numbers[i - 1] + fibonacci_numbers[i - 2]
  if number < 100
    fibonacci_numbers[i] = number
  else
    break 
  end
end

puts fibonacci_numbers
