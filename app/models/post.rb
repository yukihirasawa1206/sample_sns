class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, ->{order(created_at: :desc)}, dependent: :destroy
  
  def is_belongs_to? user
    Post.find_by(id: id, user_id: user.id)
  end
  
  def is_liked user
    Like.find_by(user_id: user.id, post_id: id)
  end
  
end
