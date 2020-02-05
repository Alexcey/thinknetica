class Route
  attr_accessor :list_stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
  end

  def add_station(station)
    @list_stations << station
  end

  def delete_station(station)
    @list_stations.delete(station)
  end
end
