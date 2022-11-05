class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to book_path(@comment.book_id)
    else
      @book = @comment.book
      @comments = @book.comments
      render "prototypes/show"
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :prototype_id).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
