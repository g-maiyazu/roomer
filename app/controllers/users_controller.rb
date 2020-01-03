class UsersController < ApplicationController
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all.page(params[:page]).per(9).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts.page(params[:page]).per(Constants::PostConut::PAGE).search(params[:search])
  end

  def search
    @q = User.ransack(params[:q])
    @users =
      if params[:q].nil?
        @q.result(distinct: true).page(params[:page]).per(24)
      elsif params[:q][:user_name_cont].blank?
        User.none
      else
        @q.result(distinct: true).page(params[:page]).per(24)
      end
  end

  def destroy
    User.find_by!(user_name: params[:user_name]).destroy
    flash[:success] = 'ユーザーは正常に削除されました'
    redirect_to users_url
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(Constants::FollowConut::PAGE)
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(Constants::FollowConut::PAGE)
    render 'show_follow'
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
