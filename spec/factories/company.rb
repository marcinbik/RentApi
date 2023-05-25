FactoryBot.define do
  factory :company do
    name { Faker::Space.company }
    address { Faker::Address.full_address }
    nip { Faker::Number.decimal_part(digits: 11) }
    company_type { 'work' }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    note { Faker::Hipster.sentence }
    company_id { FactoryBot.create(:user) }
  end
end
