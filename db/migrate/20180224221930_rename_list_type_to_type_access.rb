class RenameListTypeToTypeAccess < ActiveRecord::Migration[5.1]
  def change
    rename_column :lists, :type, :type_access
  end
end
