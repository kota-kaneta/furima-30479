class Shipping < ApplicationRecord
  belongs_to :product, optional: true
  has_one :purchase
end
