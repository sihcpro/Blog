class CreateTagPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_posts do |t|
      t.belongs_to :tag
      t.belongs_to :post
    end
  end
end
