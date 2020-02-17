class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.new()
  end

  def new
    @user = User.new()
  end
end
