class UsersController < ApplicationController
  before_action :set_user_search
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all.page(params[:page]).per(Constants::Page::Count)
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts.page(params[:page]).per(Constants::Page::Count)
  end

  def destroy
    User.find_by!(user_name: params[:user_name]).destroy
    flash[:success] = 'ユーザーは正常に削除されました'
    redirect_to users_url
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(Constants::Page::Count)
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(Constants::Page::Count)
    render 'show_follow'
  end

  def set_user_search
    @search_user = User.ransack(params[:q])
    @search_users = @search_user.result.page(params[:page]).per(Constants::Page::Count)
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
