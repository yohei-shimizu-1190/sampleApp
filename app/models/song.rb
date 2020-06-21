class Song < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true
  validates :point, presence: true
end
