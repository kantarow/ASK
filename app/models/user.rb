class User < ApplicationRecord
  self.primary_key = :id_name
  has_many :following_relationships, class_name: "Relationship", dependent: :destroy, foreign_key: "follower_id"
  has_many :following_users, through: :following_relationships, source: 'following'
  has_many :follower_relationships, class_name: "Relationship", dependent: :destroy, foreign_key: "following_id"
  has_many :followers, through: :follower_relationships
  has_many :follow_tag_relationships, dependent: :destroy
  has_many :following_tags, through: :follow_tag_relationships, source: :tag

  has_many :like_relationships, dependent: :destroy
  has_many :like_items, through: :like_relationships, source: :item

  has_many :items, dependent: :destroy, primary_key: "id_name"
  attr_accessor :remember_token
  
  has_secure_password

  email_regex = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :id_name,     presence: true,
                        uniqueness: true,
                            length: (1..50)

  validates :screen_name, presence: true,
                            length: (1..50)

  validates :email,       presence: true,
                        uniqueness: true,
                            length: { maximum: 50 },
                            format: { with: email_regex }


  def like?(item)
    like_relationships.exists?(item_id: item.id)
  end

  def like!(item)
    like_relationships.create!(item: item) unless self.like?(item)
  end
  
  def unlike!(item)
    like_relationships.find_by(item_id: item.id).destroy
  end

  def add_follower(user)
    follower_relationships.create!(follower_id: user.id)
  end

  def followed?(user)
    follower_relationships.exists?(follower_id: user.id)
  end

  def remove_follower(user)
    follower_relationships.find_by(follower_id: user.id).destroy
  end

  def following?(other)
    other.followed?(self)
  end

  def follow!(other)
    other.add_follower(self)
  end

  def unfollow!(other)
    other.remove_follower(self)
  end

  def remember
    @remember_token = User.generate_token
    update_attribute(:remember_digest, User.digest(@remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def timeline
    Item.where(id: self.following_users.map{|user| user.items.map(&:id)}).order(created_at: :desc).limit(10)
  end

  class << self
    def generate_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
