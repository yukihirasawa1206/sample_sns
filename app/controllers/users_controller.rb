class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:photos, :likes, :comments)
    @saved = Post.joins(:bookmarks).where(user_id: current_user.id).
      includes(:photos, :likes, :comments) if @user == current_user
  end
  
  def search
    @search = User.search(params[:term])
    respond_to :js
  end
  
end

