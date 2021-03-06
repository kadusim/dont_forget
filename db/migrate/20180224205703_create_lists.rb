class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :type
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
