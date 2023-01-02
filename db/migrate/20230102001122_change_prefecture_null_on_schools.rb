class ChangePrefectureNullOnSchools < ActiveRecord::Migration[6.0]
  def change
    change_column_null :schools, :prefecture_id, true
    change_column_null :schools, :city_id, true
  end
end
