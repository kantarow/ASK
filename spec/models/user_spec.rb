require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without name_id" do
    user = FactoryBot.build(:user){|user| user.id_name = nil}
    expect(user).to be_invalid
  end

  it "is invalid with too long name_id" do
    user = FactoryBot.build(:user){|user| user.id_name = "a" * 50}
    expect(user).to be_invalid
  end

  it "is invalid with not unique name_id" do
    user1 = FactoryBot.create(:user){|user| user.id_name = "hoge"}
    user2 = FactoryBot.build(:user){|user| user.id_name = "hoge"}
    expect(user2).to be_invalid
  end

  it "is invalid without screen_name" do
    user = FactoryBot.build(:user){|user| user.screen_name = nil}
    expect(user).to be_invalid
  end

  it "is invalid with too long screen_name" do
    user = FactoryBot.build(:user){|user| user.screen_name = "a" * 50}
    expect(user).to be_invalid
  end

  it "is invalid without email" do
    user = FactoryBot.build(:user){|user| user.email = nil}
    expect(user).to be_invalid
  end

  it "is invalid with not unique email" do
    user1 = FactoryBot.create(:user){|user| user.email = "test@example.com"}
    user2 = FactoryBot.build(:user){|user| user.email = "test@example.com"}
    expect(user2).to be_invalid
  end

  it "is invalid with invalid format" do
    user = FactoryBot.build(:user){|user| user.email = "hogehoge.com"}
    expect(user).to be_invalid
  end

  it "is invalid without password" do
    user = FactoryBot.build(:user){|user| user.password = nil}
    expect(user).to be_invalid
  end

  it "is invalid with too short password" do
    user = FactoryBot.build(:user) do |user|
      user.password = "short"
      user.password_confirmation = "short"
    end
    expect(user).to be_invalid
  end

  it "is invalid with password_confirmation not matches" do
    user = FactoryBot.build(:user) do |user|
      user.password = "passwordtest"
      user.password_confirmation = "passwordhogehoge"
    end
    expect(user).to be_invalid
  end

  it "is valid with correct information" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
end
