class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_follower_id
      t.integer :list_followed_id

      t.timestamps
    end
    add_index :favorites, :user_follower_id
    add_index :favorites, :list_followed_id
    add_index :favorites, [:user_follower_id, :list_followed_id], unique: true
  end
end
