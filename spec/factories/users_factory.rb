FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday }
  end
end
