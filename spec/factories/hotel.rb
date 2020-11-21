FactoryBot.define do
  factory :hotel do
    name { FFaker::Company.name }
    location  { FFaker::Address.street_address }

    trait :with_rooms do
      room_types { build_list(:room_type, 1) }
    end

    trait :with_rooms_attributes do
      room_types_attributes { attributes_for_list(:room_type, 1) }
    end

    trait :with_invalid_rooms do
      room_types { build_list(:room_type, 1, name: nil) }
    end
  end
end