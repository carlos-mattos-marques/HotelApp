class Hotel < ApplicationRecord
  has_many :room_types, dependent: :destroy
  accepts_nested_attributes_for :room_types, allow_destroy: true

  validates :name, :location, presence: true
  validates_associated :room_types
  
  scope :with_vacancies, -> { joins(:room_types).where(room_types: { available: true }).uniq }
end
