FactoryBot.define do
  factory :purchase_shipping do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipalities { '市町村' }
    address { '1111-1' }
    phone_number { '09012345678' }
    product_id { 1 }
    token { '1a2b3c' }
  end
end
