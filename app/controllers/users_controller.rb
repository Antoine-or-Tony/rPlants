class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
