class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :search, :edit, :destroy]

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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to search_admins_path
  end

  def edit
    @user = User.find(patams[:id])
  end

end
