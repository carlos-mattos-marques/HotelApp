FactoryBot.define do
  factory :room_type do
    name { FFaker::Address.secondary_address }
    available  { true }
    hotel
  end
end
