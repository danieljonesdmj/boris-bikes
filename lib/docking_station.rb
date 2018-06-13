require_relative 'bike'

class DockingStation

  def initialize
    @counter = 0
  end

  def release_bike
    fail "no bikes available" if @counter < 1
    @counter -= 1
    Bike.new
  end

  def dock(bike)
    @counter += 1
    @bike = bike
  end


# attr_writer :counter
  attr_reader :bike
end
