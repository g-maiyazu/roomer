class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :correct_user, only: %i[edit update]

  def show
    @post = Post.find_by(id: params[:id])
    @post_likes = @post.liked_users.page(params[:page]).per(Constants::UserConut::PAGE)
    @comments = @post.comments.page(params[:page]).per(10)
    @comment = @post.comments.build
  end

  def new
    @post = current_user.posts.build if user_signed_in?
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = '投稿されました'
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = '投稿できませんでした。画像とキャプションを確認してください。'
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿が更新されました'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '投稿が削除されました'
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption, :user_id)
  end

  def correct_user
    @post = Post.find_by(id: params[:id])
    redirect_to(root_url) unless (@post.user == current_user) || current_user.admin?
  end
end
