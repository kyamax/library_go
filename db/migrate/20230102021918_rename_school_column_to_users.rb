class RenameSchoolColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :school, :school_id
  end
end
