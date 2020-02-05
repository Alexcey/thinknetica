class Station
  attr_accessor :list_trains

  def initialize(name)
    @name = name
    @list_trains = []
  end

  def input_train(train)
    self.list_trains << train
  end

  #def return_all_train_in_station
  #  self.list_trains.each { |train| puts train }
  #end

  def return_train_of_type(type)
    list_type = []
    self.list_trains.each { |train| list_type << train if train.type == type }
    puts list_type
  end

  def send_train(train)
    self.list_trains.delete(train)
  end
end
