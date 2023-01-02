class ChangeDatatypeSchoolOfAdmins < ActiveRecord::Migration[6.0]
  def change
    change_column :admins, :school, :integer
  end
end
