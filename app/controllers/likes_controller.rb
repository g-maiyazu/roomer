class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    @post.like(current_user) unless @post.like?(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end

  def destroy
    like = Like.find_by(id: params[:id])
    if like.nil?
      @post = Post.find(params[:post_id])
    else
      @post = Like.find(params[:id]).post
      @post.unlike(current_user)
    end
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end
end
