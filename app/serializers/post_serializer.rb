class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at
  # belongs_to :user
  has_many :comments
  has_many :likes
  has_many :dislikes
end
