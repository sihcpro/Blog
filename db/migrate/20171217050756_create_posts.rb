class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.belongs_to  :user
      t.string      :postname
      t.string      :content

      t.timestamps
    end
  end
end
