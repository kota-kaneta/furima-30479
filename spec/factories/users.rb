FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 4)}
    first_name {Faker::Name.initials(number: 4)}
    last_name {Faker::Name.initials(number: 4)}
    first_name_ruby {Faker::Name.initials(number: 4)}
    last_name_ruby {Faker::Name.initials(number: 4)}
    birthday {Faker::Date.in_date_period}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
