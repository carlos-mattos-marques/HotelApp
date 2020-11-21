require 'rails_helper'

RSpec.describe Hotel, type: :model do
  it 'is valid with all attributes' do
    expect(build(:hotel, name: nil, location: nil)).to_not be_valid
  end

  it 'is not valid without a name' do
    expect(build(:hotel, name: nil)).to_not be_valid
  end

  it 'is not valid without a location' do
    expect(build(:hotel, location: nil)).to_not be_valid
  end

  context 'room types creation' do
    it 'creates them, with a list of RoomType instances' do
      create(:hotel, :with_rooms)
    end

    it 'creates them, with nested attributes' do
      create(:hotel, :with_rooms_attributes)
    end
  end

  context 'with rooms' do
    let(:hotel) { create(:hotel, :with_rooms) }

    it 'validates them' do
      hotel.room_types.last.name = nil
      expect(hotel.room_types.last).to_not be_valid
    end

    context 'room types destruction' do
      it 'destroys them by calling #destroy on the children object' do
        hotel.room_types.last.destroy!
        expect(hotel.reload.room_types.length).to eql(0)
      end

      it 'destroys them, by setting the nested attribute "_destroy" with an id present' do
        hotel.update(room_types_attributes: { id: hotel.room_types.last.id, _destroy: true })
        expect(hotel.reload.room_types.length).to eql(0)
      end
    end

    context 'room types update' do
      let(:name) { 'new_name' }

      it 'updates them, by setting the nested attributes with an id' do
        hotel.update(room_types_attributes: { id: hotel.room_types.last.id, name: name })
        expect(hotel.reload.room_types.last.name).to eql(name)
      end
    end
  end
end
