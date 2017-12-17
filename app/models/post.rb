class Post < ApplicationRecord
  validates :user_id, :name, :content, presence: true

  belongs_to :user
end
