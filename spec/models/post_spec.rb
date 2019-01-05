require 'rails_helper'

RSpec.describe Post, type: :model do
  
  before do 
    @post = FactoryBot.build(:post)
  end
  
  it "has a valid factory" do
    expect(@post).to be_valid 
  end
  
  it "is invalid without content" do
    @post.content = nil
    @post.valid?
    expect(@post.errors[:content]).to include("can't be blank")
  end
  
  it "is invalid without user_id" do
    @post.user_id = nil
    @post.valid?
    expect(@post.errors[:user_id]).to include("can't be blank")
  end
  
  it "can have many comments" do
    @post_with_comment = FactoryBot.create(:post,:with_comments)
    expect(@post_with_comment.comments.count).to eq 5
  end
  
  it "can have many likes" do
    @post_with_likes = FactoryBot.create(:post, :with_likes)
    expect(@post_with_likes.likes.count).to eq 5
  end
  
  it "can have many bookmarks" do 
    @post_with_bookmarks = FactoryBot.create(:post, :with_bookmarks)
    expect(@post_with_bookmarks.bookmarks.count).to eq 5
  end
  
end
