class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @books = @admin.books
    @likes = Like.where(admin_id: @admin.id).all
  end

  def index
    # @users = User.all
    @user_search = User.ransack(params[:q])
    @users = @user_search.result
  end

  def search
    # @users = User.all
    @user_search = User.ransack(params[:q])
    @users = @user_search.result
  end

end
