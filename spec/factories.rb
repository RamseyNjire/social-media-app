FactoryBot.define do
  factory :user, aliases: [:friend] do
    name { "Reson" }
    email { "reson.njeri@gmail.com" }
    password { "password" }
  end
  factory :friendship do
    user { user }
    association { :friend, factory: :user, name: "meteur", email: "meteur@gmail.com", strategy: :build }
    status { false }
  end
end