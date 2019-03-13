class Tag < ApplicationRecord
  has_many :item_tag_relationships
  has_many :items, through: :item_tag_relationships
  validates :name, presence: true, length: (1..30)
  has_many :follow_tag_relationships, dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :user

  validates :name, uniqueness: true

  def add_follower(user)
    follow_tag_relationships.create!(user: user)
  end

  def followed?(user)
    follow_tag_relationships.exists?(user_id: user.id)
  end

  def remove_follower(user)
    follow_tag_relationships.find_by(user_id: user.id).destroy
  end
end
