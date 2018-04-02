class RemoveFatherIdTasks < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:tasks, :father, index: true)
  end
end
