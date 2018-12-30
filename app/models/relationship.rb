class Relationship < ApplicationRecord 
  belongs_to :following, class_name: "User"
  belongs_to :follower,  class_name: "User"
  validates :following, presence: true,
                        uniqueness: { scope: :follower }
  validates :follower,  presence: true,
                        uniqueness: { scope: :following }
end
