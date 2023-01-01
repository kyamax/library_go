class UserBookForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :book_name, :grade_id

end