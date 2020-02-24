class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add(train)
    trains << train
  end

  def select(type)
    puts trains.select { |train| train.type == type }
  end

  #не тру метод, но для примера сойдет
  def remove(train)
    trains.delete(train)
  end
end
