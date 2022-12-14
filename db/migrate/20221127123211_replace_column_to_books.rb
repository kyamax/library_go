class ReplaceColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :books, :user, null: false, foreign_key: true
    add_reference :books, :user, foreign_key: true
  end
end
