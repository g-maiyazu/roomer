class StaticPagesController < ApplicationController
  def home
    @latest_posts = Post.page(params[:page]).per(9).search(params[:search])
    @feed_posts = current_user.feed.page(params[:page]).per(5).search(params[:search]) if user_signed_in?
  end

  def about
  end

  def tos
  end
end
