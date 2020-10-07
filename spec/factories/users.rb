FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname { Faker::Name.initials(number: 4) }
    first_name { "田中" }
    last_name { "太郎" }
    first_name_ruby { person.first.katakana}
    last_name_ruby { person.last.katakana}
    birthday { Faker::Date.in_date_period }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
