class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :destroy]
  
  def index
		@posts = Post.paginate(page: params[:page], per_page: 5 ).includes(:photos, :user, :likes, :bookmarks).
			order("created_at desc")
    @post = Post.new
    @comment = Comment.new
    @is_bookmarked = @post.is_bookmarked(current_user)
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if params[:images]
        params[:images].each do |img|
          @post.photos.create(image: params[:images][img])
        end
      end
      redirect_to posts_path
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong ..."
      redirect_to posts_path
    end
  end
  
  def show
    @photos = @post.photos
    @likes = @post.likes.includes(:user)
    @is_liked = @post.is_liked(current_user)
    @comment = Comment.new
    @is_bookmarked = @post.is_bookmarked(current_user)
  end
  
  def destroy
    if @post.user == current_user
      if @post.destroy
        redirect_to posts_path
        flash[:notice] = "Post deleted!"
      else
        redirect_to posts_path
        flash[:alert] = "Something went wrong ..."
      end
    else
      redirect_to root_path
      flash[:danger] = "You don't have permission to do that!"
    end
  end
  
  private
  
  def find_post
    @post = Post.find_by(id: params[:id])
    return if @post
    flash[:denger] = "Post not exists!"
    redirect_to root_path
  end
  
  def post_params
    params.require(:post).permit(:content)
  end
  
end
