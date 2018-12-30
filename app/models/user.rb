class User < ApplicationRecord
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :items
  attr_accessor :remember_token
  self.primary_key = :id_name
  
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

  validates :password,    presence: true,
                            length: (6..50)

  def following?(other)
    following_relationships.exists?(following_id: other.id)
  end

  def followed?(other)
    follower_relationships.exists?(follower_id: other.id)
  end

  def follow!(other)
      self.following_relationships.create!(following: other)
    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors
  end

  def unfollow!(other)
    following_relationships.find_by(following_id: other.id).destroy
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
