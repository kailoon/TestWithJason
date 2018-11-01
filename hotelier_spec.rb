require 'rspec'

class Hotel
  attr_accessor :guests

  def initialize
    @guests =[]
  end

  def check_in_guest(guest_name)
    @guests << guest_name
  end

  def check_out_guest(guest_name)
    @guests.delete(guest_name)
  end
end

describe Hotel do
  it 'can check in a guest' do
    hotel = Hotel.new
    hotel.check_in_guest('George Harrison')
    expect(hotel.guests).to include 'George Harrison'
  end

  it 'can check out a guest' do
    # instantiate a hotel
    hotel = Hotel.new

    # check a guest into the hotel
    hotel.check_in_guest('Michael')

    # check the same guest out of the hotel
    hotel.check_out_guest('Michael')

    # expect that the hotel's guests do not include that guest
    expect(hotel.guests).not_to include 'Michael'
  end

end
