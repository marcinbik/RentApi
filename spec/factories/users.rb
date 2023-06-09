FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    passwd { "1Password@" }
    country { Faker::Address.country }
    city { Faker::Address.city }
    post_code { Faker::Address.zip_code }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    company { Faker::Space.company }
    role { 'boss' }
    personal_number { Faker::Number.decimal_part(digits: 11) }
    note { Faker::Hipster.sentence }
   # company { FactoryBot.create(:company) }
  end
end