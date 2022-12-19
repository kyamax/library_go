class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :search]

  def show
    @admin = Admin.find(params[:id])
    @books = @admin.books
    @likes = Like.where(admin_id: @admin.id).all
  end

  def index
    @user_search = User.ransack(params[:q])
    @users = @user_search.result
  end

  def search
    @user_search = User.ransack(params[:q])
    @users = @user_search.result
  end

end
