class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new()
    authorize @user
  end

  def create
    @user = User.new(user_params)
    @user.save
    authorize @user

    redirect_to user_path(@user)
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    authorize @user
    # no need for app/views/restaurants/update.html.erb
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # no need for app/views/bookings/destroy.html.erb
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :bio)
  end
end


# To do - edit, update, destroy
