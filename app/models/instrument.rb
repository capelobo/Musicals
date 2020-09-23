class Instrument < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :order
end
