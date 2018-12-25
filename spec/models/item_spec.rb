require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:item) do
    build(:user) do |u|
      u.items.build(attributes_for(:items))
    end
  end
  it "is invalid without title"
  it "is invalid without content"
  it "is invalid without user"
end
