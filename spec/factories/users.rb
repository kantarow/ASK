FactoryBot.define do
  factory :user do
    id_name { "MyString" }
    screen_name { "MyString" }
    email { "MyString@example.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
end
