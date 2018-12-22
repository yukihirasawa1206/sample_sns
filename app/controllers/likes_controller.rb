class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end
  
  private
  
  def like_params 
    params.require(:like).permit(:post_id)
  end
end