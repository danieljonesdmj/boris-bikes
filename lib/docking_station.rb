require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    raise 'no bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'capacity full' if full?
    @bikes << bike
  end

  attr_reader :bikes

  private

  def full?
    @bikes.size >= 20
  end
end
