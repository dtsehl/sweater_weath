FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Hipster.words }
    api_key { Faker::Invoice.creditor_reference }
  end
end
