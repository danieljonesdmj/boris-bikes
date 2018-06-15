require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'no bikes available' if bikes.empty?
    bikes.pop
  end

  def dock(bike)
    raise 'capacity full' if full?
    bikes << bike
  end

  attr_reader :bikes
  attr_reader :capacity

  private

  def full?
    bikes.size >= capacity
  end
end
