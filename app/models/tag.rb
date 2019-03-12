class Tag < ApplicationRecord
  has_many :item_tag_relationships
  has_many :items, through: :item_tag_relationships
  validates :name, presence: true, length: (1..30)
  has_many :follower_relationships, dependent: :destroy
  has_many :followers, through: :follower_relationships

  validates :name, uniqueness: true
end
