require_relative 'bike'

class DockingStation

  def release_bike
    @bike
    fail "no bikes available" if @bike == nil
  end

  def dock(bike)
    @bike = bike
  end

  attr_reader :bike

end
