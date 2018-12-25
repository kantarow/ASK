require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ build(:user) }
  let(:other){ build(:other) }
  it "is invalid without name_id" do
    user.id_name = nil
    expect(user).to be_invalid
  end

  it "is invalid with too long name_id" do
    user.id_name = "a" * 51
    expect(user).to be_invalid
  end

  it "is invalid with not unique name_id" do
  end

  it "is invalid without screen_name" do
    user.screen_name = nil
    expect(user).to be_invalid
  end

  it "is invalid with too long screen_name" do
    user.screen_name = "a" * 51
    expect(user).to be_invalid
  end

  it "is invalid without email" do
    user.email = nil
    expect(user).to be_invalid
  end

  it "is invalid with not unique email" do
    user.update_attributes(email: "test@example.com")
    other.update_attributes(email: "test@example.com")
    expect(other).to be_invalid
  end

  it "is invalid with invalid format email" do
    user.email = "hogehoge.com"
    expect(user).to be_invalid
  end

  it "is invalid without password" do
    user.password = nil
    expect(user).to be_invalid
  end

  it "is invalid with too short password" do
    user.password = "short"
    user.password_confirmation = "short"
    expect(user).to be_invalid
  end

  it "is invalid with password_confirmation not matches" do
    user.password = "passwordtest"
    user.password_confirmation = "passwordhogehoge"
    expect(user).to be_invalid
  end

  it "is valid with correct information" do
    expect(user).to be_valid
  end
end
