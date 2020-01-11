class StaticPagesController < ApplicationController
  def home
    @users = User.all.page(params[:page]).per(Constants::Page::Count)
    @latest_posts = Post.page(params[:page]).per(Constants::Page::Count)
    @feed_posts = current_user.feed.page(params[:page]).per(Constants::Page::Count) if user_signed_in?
  end

  def about
  end

  def tos
  end
end
