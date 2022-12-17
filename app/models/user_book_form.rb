class UserBookForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :book_name, :grade_id

  # def self.search(search, grade)
  #   if search || grade != ""
  #     @book_search = Book.where('book_name LIKE(?)', "%#{search}%")
  #     @grade_search = User.where(grade_id: grade[:grade_id])
  #     @books = UserBookForm.where(" book_name IN (?) or grade_id IN (?)", book_search, grade_search)
  #   else
  #     Book.order('created_at DESC')
  #   end
  # end

      # Book.where('book_name LIKE(?)', "%#{search}%")
      # User.where(grade_id: search[:grade_id])
      # User.where('opponent LIKE(?)', "%#{search[:keyword]}%").where(grade_id: search[:grade])

end