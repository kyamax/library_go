class AddColumnBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :admin, foreign_key: true
  end
end
