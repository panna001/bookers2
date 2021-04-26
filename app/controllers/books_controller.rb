class BooksController < ApplicationController
  before_action :set_new_book, only:[:show, :index]
  before_action :set_user, only:[:show, :index]

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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

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
