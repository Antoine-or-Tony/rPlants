class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find([:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    @user.save

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :bio)
  end
end


# To do - edit, update, destroy
