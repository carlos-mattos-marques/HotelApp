class RoomType < ApplicationRecord
  belongs_to :hotel

  validates :name, :hotel, presence: true
  validates :name, uniqueness: { scope: :hotel }
  validates :available, exclusion: { in: [nil] }
end