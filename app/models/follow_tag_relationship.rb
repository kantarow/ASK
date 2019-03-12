class FollowTagRelationship < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :tag,  class_name: "Tag"

  validates :user,  presence: true,
                    uniqueness: { scope: :tag }

  validates :tag, presence: true,
                  uniqueness: { scope: :user }
end
