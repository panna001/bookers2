class BooksController < ApplicationController
  before_action :set_new_book, only:[:show, :index]

  def show
    @book_detail = Book.find(params[:id])
    @user = @book_detail.user
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render "books/index"
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  private
  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end

  def set_new_book
    @book = Book.new
  end

  

end
