class BooksController < ApplicationController
  before_action :set_new_book
  before_action :set_user

  def show
  end

  def index
    @books = Book.all

  end

  def new
  end

  def edit
  end

  private

  def set_new_book
    @book = Book.new
  end

  def set_user
    @user = current_user
  end
end
