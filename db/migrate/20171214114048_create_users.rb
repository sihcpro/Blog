class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.integer :gender
      t.integer :role, default: 0
      t.string :auth_token
      # t.datetime :birthday
      # t.string :avatar
      # t.string :provider
      # t.string :uid
      # t.datetime :confirm_at

      t.timestamps
    end
  end
end
