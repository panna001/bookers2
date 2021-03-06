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
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end
  
  def follows
    user = User.find(params[:id])
    @follows = user.followings
  end
  
  def followers
    user = User.find(params[:id])
    @followers = user.followers
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def set_new_book
    @book = Book.new
  end

end
