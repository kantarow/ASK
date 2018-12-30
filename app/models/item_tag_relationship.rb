class ItemTagRelationship < ApplicationRecord
  belongs_to :tag
  belongs_to :item
  validates :tag,  presence: true,
                   uniqueness: { scope: :item }
  validates :item, presence: true,
                   uniqueness: { scope: :tag }
end
