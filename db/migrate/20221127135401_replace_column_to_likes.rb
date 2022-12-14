class ReplaceColumnToLikes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :admin, foreign_key: true
  end
end
