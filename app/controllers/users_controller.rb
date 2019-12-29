class UsersController < ApplicationController
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all.page(params[:page]).per(Constants::UserConut::PAGEINATE)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find_by!(user_name: params[:user_name]).destroy
    flash[:success] = 'ユーザーは正常に削除されました'
    redirect_to users_url
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
