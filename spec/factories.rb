FactoryBot.define do
  factory :user, aliases: [:friend] do
    name { "Reson" }
    email { "reson.njeri@gmail.com" }
    password { "password" }
  end

  factory :friendship do
    user { user }
    friend { user, name: "meteur", email: "meteur@gmail.com" }
    status { false }
  end
end