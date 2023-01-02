class ChangeDatatypeSchoolOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :school, :integer
  end
end
