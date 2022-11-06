class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @likes = Like.where(user_id: @user.id).all
  end
end
