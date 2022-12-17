class RecommendsController < ApplicationController
  def index
    # binding.pry
    @recommends = Book.where.not(admin_id: nil).order('created_at DESC').includes(:comments, :likes)
    @q = Book.ransack(params[:q])
    @books = @q.result
  end
end
