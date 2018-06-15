require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'accepts a user set capacity' do
    station = DockingStation.new(25)
    expect(station.capacity).to eq(25)
  end

  it 'releases working bikes' do
    expect(Bike.new).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  describe 'dock(bike)' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'not releasing broken bike' do
      bike = Bike.new
      bike.working = false
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('no bikes available')
    end

    it 'lets user flag bike as broken' do
      bike = Bike.new
      bike.working = false
      expect(bike.working).to eq false
    end

    it 'returns error if capacity hit' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error('capacity full')
    end

    it 'returns false if not full' do
      expect(subject.instance_eval { full? }).to eq false
    end

    it 'returns true if full' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect(subject.instance_eval { full? }).to eq true
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'returns error if no bikes available' do
      expect { subject.release_bike }.to raise_error('no bikes available')
    end
  end
end
