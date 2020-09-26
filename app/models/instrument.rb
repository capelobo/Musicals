class Instrument < ApplicationRecord
  has_one_attached :photo
  belongs_to :user, dependent: :destroy
  has_one :order

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
