class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :user, optional: true
  belongs_to :product, optional: true
  belongs_to :shipping, optional: true
end
