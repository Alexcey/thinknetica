require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'pass_train'
require_relative 'cargo_train'
require_relative 'pass_wagon'
require_relative 'cargo_wagon'

class RailRoad
  attr_reader :stations, :trains, :routes, :wagons

  VALUE = ['cargo','pass']

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
      puts 'Введите 6, чтобы назначать маршрут поезду'
      puts 'Введите 7, чтобы добавлять вагоны к поезду'
      puts 'Введите 8, чтобы отцеплять вагоны от поезда'
      puts 'Введите 9, чтобы перемещать поезд по маршруту вперед'
      puts 'Введите 10, чтобы переместить поезд по маршруту назад'
      puts 'Введите 11, чтобы посмотреть все станции'
      puts 'Введите 12, чтобы посмотреть все маршруты'
      puts 'Введите 13, чтобы посмотреть все поезда'
      puts ''

      i = gets.chomp.to_i

      case i
      when 0
        puts 'Пока'
        break
      when 1
        create_stattion
      when 2
        create_train
      when 3
        create_route
      when 4
        add_station
      when 5
        remove_station
      when 6
        add_route_in_train
      when 7
        add_wagon
      when 8
        remove_wagon
      when 9
        up_route
      when 10
        down_route
      when 11
        all_stations
      when 12
        all_routes
      when 13
        all_trains
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
  #  trains << CargoTrain.new('#t1')
  #  trains << PassengerTrain.new('#t2')

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
    attempt = 0
    begin
      puts 'Номер поезда:'
      number = gets.chomp.to_s
      puts 'Тип поезда: cargo or pass'
      type = gets.chomp.to_s
      raise 'Неправильный тип поезда' if !VALUE.include?(type)
      trains << (type == 'cargo' ? CargoTrain.new(number) : PassengerTrain.new(number))
      puts "Поезд создан #{number}"
    rescue RuntimeError => e
      attempt += 1
      puts e.message
      retry if attempt < 3
      puts "Поезд не создан"
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
    puts_route
    choose(select_route).add(choose_station)
  end

  def remove_station
    puts_route
    choose(select_route).remove(choose_station)
  end

  def add_route_in_train
    puts_train
    train = choose(select_train)
    puts_route
    train.add_route(choose(select_route))
  end

  def add_wagon
    puts_train
    train = choose(select_train)
    if train.type == 'cargo'
      puts "Выберите объем:"
      size = gets.chomp.to_i
      c = CargoWagon.new(rand(100), size)
    else 
      puts "Выберите кол-во мест:"
      size = gets.chomp.to_i
      c = PassengerWagon.new(rand(100), size)
    end
    train.add_wagon(c)
  end

  def remove_wagon
    puts_train
    train = choose(select_train)
    puts "Выберите вагон"
    puts train
    puts train.wagons
    wagon = choose(select_wagon(train.wagons))
    train.remove(wagon)
  end

  def all_stations
    select_station
  end

  def all_routes
    select_route
  end

  def all_trains
    puts "Все поезда, надо сделать :)"
  end

  def list_train_in_station
    @stations.each do |station|
      puts "Станция: #{station.name}" 
      station.trains_block {|train| puts "Номер поезда: #{train.number}. Тип: #{train.type}. Кол-во вагонов: #{train.wagons.size}"}
    end
  end

  private

  def choose_station
    puts "Список станций"
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
    array[i]
  end

  def select_wagon(wagons)
    wagons.each_with_index { |value,index| 
      puts "Index: #{index}. Вагон: #{value.number}" 
    }
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

  def select_train
    trains.each_with_index { |value,index| puts "Index: #{index}. Поезд: #{value.number}" }
  end

  def puts_route
    puts "Список маршутов:"
  end

  def puts_train
    puts "Список поездов:"
  end
end
