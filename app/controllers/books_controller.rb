class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_book, only: [:edit, :show, :update]
  before_action :book_search, only: [:index, :search]

  def index
    @books = Book.order('created_at DESC').includes(:comments, :likes)
  end

  def new
    @book = Book.new
  end

  def create
    # user = User.find(params[:id])
    # admin = Admin.find(params[:id])
    if user_signed_in?
      @book = Book.new(user_book_params)
    elsif admin_signed_in?
      @book = Book.new(admin_book_params)
    end
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @book.comments
  end

  def edit
  end

  def update
    if admin_signed_in?
      @book.update(admin_book_params)
      redirect_to book_path
    elsif user_signed_in?
      @book.update(user_book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to root_path
  end

  def search
  end


  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_search
    @q = Book.ransack(params[:q])
    @books = @q.result
  end

  def user_book_params
    params.require(:book).permit(:image, :book_name, :author, :publisher, :text, :genre_id).merge(user_id: current_user.id)
  end

  def admin_book_params
    params.require(:book).permit(:image, :book_name, :author, :publisher, :text, :genre_id).merge(admin_id: current_admin.id)
  end
end
