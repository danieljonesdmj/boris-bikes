require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    raise 'no bikes available' if @bikes.size == 0
    @bikes.pop
  end

  def dock(bike)
    raise 'capacity full' if @bikes.size >= 20
    @bikes << bike
  end

  attr_reader :bikes
end
