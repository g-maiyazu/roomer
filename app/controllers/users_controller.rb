class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(Constants::UserConut::PAGEINATE)
  end

  def show
    @user = User.find(params[:id])
  end
end
