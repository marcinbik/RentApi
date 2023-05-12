FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    passwd { "password" }
   # company { FactoryBot.create(:company) }
  end
end