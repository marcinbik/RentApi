FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    passwd { "password" }
    country { Faker::Address.country }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    role { 'boss' }
   # company { FactoryBot.create(:company) }
  end
end