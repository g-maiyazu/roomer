class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to post_path(@post)
    else
      flash[:alert] = "コメントを投稿できませんでした。140字以内で入力してください。"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to request.referer || post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
