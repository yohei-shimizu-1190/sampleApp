class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :group, presence: true
end
