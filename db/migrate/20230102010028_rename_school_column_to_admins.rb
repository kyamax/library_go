class RenameSchoolColumnToAdmins < ActiveRecord::Migration[6.0]
  def change
    rename_column :admins, :school, :school_id
  end
end
