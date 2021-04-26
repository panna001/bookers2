class UsersController < ApplicationController
  before_action :set_new_book

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
  end

  def edit
  end


  private

  def set_new_book
    @book = Book.new
  end

end
