class RemoveAdminToComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :admin_id, :reference
    remove_column :comments, :admin_id_id, :reference
  end
end
