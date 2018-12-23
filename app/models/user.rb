class User < ApplicationRecord
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
end
