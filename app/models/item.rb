class Item < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: (1..100)
  validates :content, presence: true, length: (15..30000)
end
