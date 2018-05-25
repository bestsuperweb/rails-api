class User < ApplicationRecord
  #Encrypt Password
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :dislikes
  validates_presence_of :name, :email, :password_digest

  def self.find_or_create_from_auth_hash(auth_hash)
  	user = find_by(email: auth_hash[:email])
  	if user.nil?
  		user = create(email: auth_hash[:email], password_digest: "password_digest" )
  	end
    user.update(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      name: auth_hash[:name],
      auth_token: auth_hash[:token],
      auth_secret: auth_hash[:secret]
    )
    user
  end

end
