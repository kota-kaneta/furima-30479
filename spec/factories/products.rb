FactoryBot.define do
  factory :product do
    title { 'sample' }
    description { '説明' }
    price { 1000 }
    charge_id { 2 }
    day_id { 2 }
    source_id { 2 }
    category_id { 2 }
    status_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
