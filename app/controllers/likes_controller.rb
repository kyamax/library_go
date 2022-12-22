class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likes, only: [:create, :destroy]

  def create
    if user_signed_in?
      like = current_user.likes.new(book_id: @book.id)
      like.save
    elsif admin_signed_in?
      like = current_admin.likes.new(book_id: @book.id)
      like.save
    end
  end

  def destroy
    if user_signed_in?
      like = current_user.likes.find_by(book_id: @book.id)
      like.destroy
    elsif admin_signed_in?
      like = current_admin.likes.find_by(book_id: @book.id)
      like.destroy
    end
  end

  private

  def set_likes
    @book = Book.find(params[:book_id])
    @id_name = "#like_link_#{@book.id}"
  end

end
