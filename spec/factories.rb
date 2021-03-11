FactoryBot.define do
  factory :user, aliases: [:friend] do
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    password { "password" }
  end
  factory :friendship do
    association :user
    association :friend, factory: :user, name: "meteur", email: "meteur@gmail.com", strategy: :build
    status { false }
  end
end