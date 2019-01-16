class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only:[:show, :destroy, :following, :followers]
  
  def index
    @users = User.all
  end
  
  def show
    @posts = @user.posts.includes(:photos, :likes, :comments)
		@saved = Post.joins(:bookmarks).where("bookmarks.user_id=?", current_user.id).
      includes(:photos, :likes, :comments) if current_user?(@user)
  end
  
  def destroy
    if current_user?(@user)
      @user.destroy
    else
      flash[:alert] = "You don't have permission to do that!"
      redirect_to root_path
    end
  end
  
  def search
    @search = User.search(params[:term])
    respond_to :js
  end
  
  def current_user?(user)
    true if user == current_user
  end
  
  def following
    @user = User.find(id: params[:id])
    @users = @user.followings
  end
  
  def followers
    @user = User.find(id: params[:id])
    @users = @user.followers
  end
  
  private 
  
  def find_user
    @user = User.find(params[:id])
  end
  
end