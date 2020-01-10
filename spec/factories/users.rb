FactoryBot.define do
  pass = Faker::Internet.password(min_length: 8)

  factory :user do
    username              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { pass }
    password_confirmation { pass }
  end
end
