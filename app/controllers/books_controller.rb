class BooksController < ApplicationController
  before_action :set_new_book
  before_action :set_user

  def show
    @book_detail = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def create
    book = current_user.books.new(book_params)
    book.save
    redirect_to book_path(book)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def set_new_book
    @book = Book.new
  end

  def set_user
    @user = current_user
  end
end
