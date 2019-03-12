class Item < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", foreign_type: "string"
  has_many :item_tag_relationships, dependent: :destroy
  has_many :tags, through: :item_tag_relationships, source: :tag
  has_many :like_relationships, dependent: :destroy
  has_many :liked_users, through: :like_relationships, source: :user
  validates :title, presence: true, length: (1..100)
  validates :content, presence: true, length: (15..30000)

  def liked?(user)
    like_relationships.exists?(user_id: user.id)
  end

  def add(tag)
    item_tag_relationships.create!(tag_id: tag.id)
  end

  def remove(tag)
    item_tag_relationships.find_by(tag_id: tag.id).destroy
  end
end
