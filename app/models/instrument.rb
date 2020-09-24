class Instrument < ApplicationRecord
  has_one_attached :photo
  belongs_to :user, dependent: :destroy
  has_one :order
  validates :photo, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
