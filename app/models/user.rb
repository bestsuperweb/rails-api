class User < ApplicationRecord
  #Encrypt Password
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :dislikes
  validates_presence_of :name, :email, :password_digest

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.nickname,
      auth_token: auth_hash.credentials.token,
      auth_secret: auth_hash.credentials.secret
    )
    user
  end

end
