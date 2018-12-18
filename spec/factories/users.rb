FactoryBot.define do
  factory :user do
    id_name { "testuser" }
    screen_name { "testuser" }
    email { "test@example.com" }
    password { "testpassword" }
    password_confirmation { "testpassword" }
  end
end
