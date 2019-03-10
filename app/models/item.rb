class Item < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", foreign_type: "string"
  has_many :item_tag_relationships 
  has_many :tags, through: :item_tag_relationships
  has_many :like_relationshps, dependent: :destroy
  has_many :liked_user, through: :like_relationships, source: :user
  validates :title, presence: true, length: (1..100)
  validates :content, presence: true, length: (15..30000)

  def liked?(user)
    like_relationships.exists?(user_id: user.id)
  end
end
