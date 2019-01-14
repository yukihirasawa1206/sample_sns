class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only:[:show, :following, :followers]
  
  def index
    @users = User.all
  end
  
  def show
    @posts = @user.posts.includes(:photos, :likes, :comments)
		@saved = Post.joins(:bookmarks).where("bookmarks.user_id=?", current_user.id).
      includes(:photos, :likes, :comments) if @user == current_user
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
    else
      flash[:alert] = "Something went wrong ..."
    end
    redirect_to root_path
  end
  
  def search
    @search = User.search(params[:term])
    respond_to :js
  end
  
  def following
  end
  
  def followers
  end
  
  private 
  
  def find_user
    @user = User.find(params[:id])
  end
end