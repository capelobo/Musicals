class Instrument < ApplicationRecord
  has_one_attached :photo
  belongs_to :user, dependent: :destroy
  has_one :order

  validates :name, length: { in: 3..18 }, presence: true
  validates :photo, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
                  against: [:name, :description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
