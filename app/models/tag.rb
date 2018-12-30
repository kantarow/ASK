class Tag < ApplicationRecord
  has_many :item_tag_relationships
  has_many :items, through: :item_tag_relationships
  validates :name, presence: true, length: (1..30)
end
