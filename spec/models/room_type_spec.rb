require 'rails_helper'

RSpec.describe RoomType, type: :model do
  it 'is valid with all valid attributes' do
    expect(build(:room_type, name: nil, available: nil)).to_not be_valid
  end

  it 'is not valid without a name' do
    expect(build(:room_type, name: nil)).to_not be_valid
  end

  it 'is not valid when available is not a boolean' do
    expect(build(:room_type, available: nil)).to_not be_valid
  end

  it 'is not valid without a parent hotel record' do
    expect(build(:room_type, hotel: nil)).to_not be_valid
  end
  
  it 'is not valid when without an unique name scoped to its parent' do
    hotel = create(:hotel, :with_rooms)
    expect(build(:room_type, hotel: hotel, name: hotel.room_types.last.name)).to_not be_valid
  end
end

