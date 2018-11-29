class User < ApplicationRecord
  validates :fullname, presence: true
  validates :username, presence: true
  validates :email, presence: true
  has_secure_password
end
