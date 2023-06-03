FactoryBot.define do
  factory :company_customer do
    association :company, factory: :company
    association :customer, factory: :customer
  end
end