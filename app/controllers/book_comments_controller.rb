class BookCommentsController < ApplicationController
  def create
    comment = current_user.book_comments.new(book_id: params[:book_id])
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = current_user.book_comments.find_by(book_id: params[:book_id], id: [params:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
end
