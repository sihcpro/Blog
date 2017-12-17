class Tag < ApplicationRecord
  validates :tagname, uniqueness: { case_sensitive: false }

  has_many :tag_posts
  has_many :posts, through: :tag_posts
end
