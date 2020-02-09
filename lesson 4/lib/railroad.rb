require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'pass_train'
require_relative 'cargo_train'
require_relative 'pass_wagon'
require_relative 'cargo_wagon'

class RailRoad
  attr_reader :stations, :trains, :routes, :wagons

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def start(railsroad)
    loop do
      puts ''
      puts 'Введите 0, чтобы выйти из программы'
      puts 'Введите 1, чтобы создать станцию'
      puts 'Введите 2, чтобы создать поезд'
      puts 'Введите 3, чтобы создавать маршруты'
      puts 'Введите 4, чтобы добавить станцую в маршрут'
      puts 'Введите 5, чтобы удалить станцую из маршрута'
      #puts 'Введите 6, чтобы назначать маршрут поезду'
      #puts 'Введите 7, чтобы добавлять вагоны к поезду'
      #puts 'Введите 8, чтобы отцеплять вагоны от поезда'
      #puts 'Введите 9, чтобы перемещать поезд по маршруту вперед'
      #puts 'Введите 10, чтобы переместить поезд по маршруту назад'
      puts 'Введите 11, чтобы посмотреть все станции'
      puts 'Введите 12, чтобы посмотреть все маршруты'
      #puts 'Введите 13, чтобы посмотреть все поезда'
      puts ''

      i = gets.chomp.to_i

      case i
      when 0
        puts 'Пока'
        break
      when 1
        railsroad.create_stattion
      when 2
        railsroad.create_train
      when 3
        railsroad.create_route
      when 4
        railsroad.add_station
      when 5
        railsroad.remove_station
      when 6
        #railsroad.
      when 7
        #railsroad.
      when 8
        #railsroad.
      when 9
        #railsroad.
      when 10
        #railsroad.
      when 11
        railsroad.all_stations
      when 12
        railsroad.all_routes
      when 13
        #railsroad.
      end
    end
  end

  #def seed
  #  s1 = Station.new('Москва')
  #  s2 = Station.new('Питер')
  #  s3 = Station.new('Казань')
  #  s4 = Station.new('Новгород')
  #  stations.push(s1) 
  #  stations.push(s2)
  #  stations.push(s3)
  #  stations.push(s4)
  #  t1 = CargoTrain.new('#t1')
  #  t2 = PassengerTrain.new('#t2')
  #  t3 = PassengerTrain.new('#t3')

  #  r1 = Route.new(s1, s2)
  #  r2 = Route.new(s1, s3)
  #  routes << r1
  #  routes << r2
  #end

  def create_stattion
    puts 'Имя станции:'
    stations.push(Station.new(gets.chomp.to_s))
    puts 'Станция создана'
  end

  def create_train
    puts 'Номер поезда:'
    number = gets.chomp.to_s
    puts 'Тип поезда: cargo or pass'
    type = gets.chomp.to_s
    if type == 'cargo'
      trains << CargoTrain.new(number)
    elsif type == 'pass'
      trains << PassengerTrain.new(number)
    else
      puts 'Поезд не создан. Неверный тип поезда'
    end
  end

  def create_route
    puts "Выберите начальную станцию"
    first = choose(select_station)
    puts "Выберите конечную станцию"
    last = choose(select_station)
    routes << Route.new(first, last)
    puts "Маршут создан"
  end

  def add_station
    puts "Выберите маршут"
    route = choose(select_route)
    route.add(choose_station)
  end

  def remove_station
    puts "Выберите маршут"
    route = choose(select_route)
    route.remove(choose_station)
  end

  def all_stations
    select_station
  end

  def all_routes
    select_route
  end

  private

  def choose_station
    puts "Выберите станцию"
    station = choose(select_station)
  end

  def choose(array)
    puts "Выберите Index"
    i = 0
    loop do 
      i = gets.chomp.to_i
      if i >= 0 && i <= array.length - 1 
        break
      else
        puts "Индекс в не диапазона"
      end
    end
    stations[i]
  end

  def select_station
    stations.each_with_index { |value,index| puts "Index: #{index}. Cтанция: #{value.name}" }
  end

  def select_route
    routes.each_with_index { |value,index| 
      arr = []
      value.stations.each { |st| arr << st.name }
      puts "Index: #{index}. Путь следования: #{arr}" 
    }
  end
end
