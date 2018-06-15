require_relative 'bike'

class DockingStation
  def release_bike
    raise 'no bikes available' unless @bike
    @bike
  end

  def dock(bike)
    raise 'capacity full' if @bike
    @bike = bike
  end

  attr_reader :bike
end
