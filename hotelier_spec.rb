require 'rspec'

class Hotel
  attr_accessor :guests

  def initialize
    @guests = []
    @occupied_rooms = []
  end

  def check_in_guest(guest_name,room_number)
    return false if @occupied_rooms.include?(room_number)
    @guests << guest_name
    @occupied_rooms << room_number
    true
  end

  def check_out_guest(guest_name)
    @guests.delete(guest_name)
  end
end

describe Hotel do
  let (:hotel) { Hotel.new }
  describe 'checking in guest' do

    it 'adds the guest into the guest list' do
      hotel.check_in_guest('George Harrison',88)
      expect(hotel.guests).to include 'George Harrison'
    end

    context 'room is available' do
      it 'allows check in' do
        expect(hotel.check_in_guest('George Harrison',88)).to be true
      end
    end

    context 'room is not available' do
      it 'disallows check-in' do
        hotel.check_in_guest('George Harrison',88)
        expect(hotel.check_in_guest('John Doe',88)).to be false
      end
    end

    it 'does not add the guest to the guest list' do
      hotel.check_in_guest('Jordan',44)
      hotel.check_in_guest('Kobe',44)
      expect(hotel.guests).not_to include 'Kobe'
    end
  end

  it 'can check out a guest' do
    # instantiate a hotel
    # check a guest into the hotel
    hotel.check_in_guest('Michael',99)
    # check the same guest out of the hotel
    hotel.check_out_guest('Michael')
    # expect that the hotel's guests do not include that guest
    expect(hotel.guests).not_to include 'Michael'
  end

end
