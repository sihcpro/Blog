class Post < ApplicationRecord
  validates :user_id, :content, presence: true

  belongs_to :user
  has_many :tag_posts
  has_many :tags, through: :tag_posts
end
