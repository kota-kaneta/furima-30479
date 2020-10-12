class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :charge
  belongs_to_active_hash :day
  belongs_to_active_hash :source
  belongs_to_active_hash :category
  belongs_to_active_hash :status

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :title, :description, :price, :charge_id, :day_id, :source_id, :category_id, :status_id, :image, presence: true
  validates :charge_id, :day_id, :source_id, :category_id, :status_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
end
