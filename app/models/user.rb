class User < ApplicationRecord
  #Encrypt Password
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :dislikes
  validates_presence_of :name, :email, :password_digest

end
