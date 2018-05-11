FactoryBot.define do
  factory :user do
    email "email@example.pl"
    name { Faker::Name.name }
    confirmed_at Time.zone.now
    password 'password'
  end
end
