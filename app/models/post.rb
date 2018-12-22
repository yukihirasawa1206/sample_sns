class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  
  def is_belongs_to? user
    Post.find_by(id: id, user_id: user.id)
  end
end
