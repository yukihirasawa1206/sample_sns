class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @comments = @post.comments.includes(:user)
  end
  
  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    if @comment.save
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end
  
  def destroy
    # @comment = Comment.find_by(id: params[:id])主キーの場合findで良い
    @comment = Comment.find(params[:id])
    if @comment.destroy  
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end