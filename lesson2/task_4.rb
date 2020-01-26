# task4_1
calendar = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30,
             'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31,
             'September' => 30, 'October' => 31, 'November' => 31, 'December' => 31 }
calendar.each { |key, value| puts key if value == 30 }

# task4_2
array = Array.new {}
j = 10
(0..18).each do |i|
  array[i] = j
  j += 5
end

# task4_3
array2 = Array.new {}
array2[0] = 0
array2[1] = 1
i = 2

while array2[i - 1] < 100
  array2[i] = array2[i - 1] + array2[i - 2]
  i += 1
end
array2.pop

# task4_4
english_letter = { 'A' => 0, 'E' => 4, 'I' => 8, 'O' => 14, 'U' => 20 }
puts english_letter
