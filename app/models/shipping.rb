class Shipping < ApplicationRecord
  belongs_to :product
  has_one :order

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
  validates :order_id, presence: true

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: {with: /\A\d{11}\z/ }
end
