class ItemTagRelationship < ApplicationRecord
  belongs_to :tag, class_name: "Tag"
  belongs_to :item, class_name: "Item"
  validates :tag,  presence: true,
                   uniqueness: { scope: :item }
  validates :item, presence: true,
                   uniqueness: { scope: :tag }
end
