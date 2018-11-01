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

  def check_out_guest(guest_name,room_number)
    @guests.delete(guest_name)
    @occupied_rooms.delete(room_number)
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

  describe 'checking out a guest' do
    it 'can check out a check_out_guest' do
      hotel.check_in_guest('Michael',99)
      hotel.check_out_guest('Michael',99)
      expect(hotel.guests).not_to include 'Michael'
    end

    it 'frees up the room' do
      hotel.check_in_guest('Sally',11)
      hotel.check_out_guest('Sally',11)
      expect(hotel.check_in_guest('Priscillia',11)).to be true
    end
  end

end
