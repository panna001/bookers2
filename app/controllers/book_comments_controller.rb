class BookCommentsController < ApplicationController
  def create
    @book_detail = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(comment_params)
    @book_comment.book_id = @book_detail.id
    @book_comment.save
    @comments = @book_detail.book_comments
  end

  def destroy
    @book_detail = Book.find(params[:book_id])
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    @comments = Book.find(params[:book_id]).book_comments
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
