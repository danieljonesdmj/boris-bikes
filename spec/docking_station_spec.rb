require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }


  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  describe '#release_bike' do
  it "will not release bike if counter is zero" do
    expect {subject.release_bike}.to raise_error "no bikes available"
  end
  end

  it "docks something" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
    expect(subject).to respond_to(:bike)
  end
end
