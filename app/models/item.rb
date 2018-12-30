class Item < ApplicationRecord
  belongs_to :user
  has_many :item_tag_relationships
  has_many :tags, through: :item_tag_relationships
  validates :title, presence: true, length: (1..100)
  validates :content, presence: true, length: (15..30000)
end
