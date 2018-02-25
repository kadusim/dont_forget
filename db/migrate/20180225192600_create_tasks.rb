class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :status
      t.references :list, foreign_key: true
      t.references :father

      t.timestamps
    end
  end
end
