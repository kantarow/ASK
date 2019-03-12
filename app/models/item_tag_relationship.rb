class ItemTagRelationship < ApplicationRecord
  belongs_to :tag
  belongs_to :item
  validates :tag,  presence: true,
                   uniqueness: { scope: :item }
  validates :item, presence: true,
                   uniqueness: { scope: :tag }

  belongs_to :tag, class_name: "Tag"
  belongs_to :user, class_name: "Item"

  validates :user, presence: true,
                   uniqueness: { scope: :tag }

  validates :tag, presence: true,
                  uniqueness: { scope: :user }

end
