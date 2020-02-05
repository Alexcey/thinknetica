puts 'Напиши день'
day = gets.chomp.to_i

puts 'Напиши месяц'
month = gets.chomp.to_i

puts 'Напиши год'
year = gets.chomp.to_i

calendar = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30,
             'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30,
             'October' => 31, 'November' => 31, 'December' => 31 }

if day > 31 || day < 1 || month < 1 || month > 12 || year < 1
  puts 'Неверные данные'
else
  if year % 400 == 0 || year % 4 == 0 && year % 100 != 0
    calendar['February'] = 29
  end
  i = 1
  number = day
  calendar.each do |h_month, h_day|
    if i == month
      break
    else
      number += h_day
      i += 1
    end
  end
end

puts "порядковый номер = #{number}"
