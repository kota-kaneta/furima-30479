class Shipping < ApplicationRecord
  belongs_to :product
  has_one :order
end
