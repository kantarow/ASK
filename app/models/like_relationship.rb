class LikeRelationship < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :item, class_name: "Item"

  validates :user,  presence: true,
                         uniqueness: { scope: :item }

  validates :item, presence: true,
                         uniqueness: { scope: :user }
end
