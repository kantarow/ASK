FactoryBot.define do
  factory :user do
    id_name { "user" }
    screen_name { "User" }
    email { "user@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :other, class: User do
    id_name { "other" }
    screen_name { "Other" }
    email { "other@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
