# task4_2
array = Array.new []
j = 10
i = 0
while true
  array[i] = j
  j += 5
  break if array[i] == 100 
  i += 1
end

puts array
