class StaticPagesController < ApplicationController
  def home
    @users = User.all.page(params[:page]).per(Constants::Page::Count).search(params[:search])
    @latest_posts = Post.page(params[:page]).per(Constants::Page::Count).search(params[:search])
    if user_signed_in?
      @feed_posts = current_user.feed.page(params[:page]).per(Constants::Page::Count).search(params[:search])
    end
  end

  def about
  end

  def tos
  end
end
