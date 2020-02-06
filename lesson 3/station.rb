class Station
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add(train)
    trains << train
  end

  def select_of_type(type)
    type = []
    trains.select { |train| type << train if train.type == type }
    puts type
  end

  #не тру метод, но для примера сойдет
  def send_train(train)
    trains.delete(train)
  end
end
