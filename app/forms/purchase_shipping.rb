class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :product_id, :user_id, :token

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :product_id, presence: true
  validates :token, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :phone_number, format: { with: /\A\d{11}\z/ }

  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
