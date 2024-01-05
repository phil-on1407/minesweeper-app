FactoryBot.define do
  factory :board do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    width { Faker::Number.between(from: 5, to: 10) }
    height { Faker::Number.between(from: 5, to: 10) }
    mines { Faker::Number.between(from: 1, to: 5) }
  end
end
