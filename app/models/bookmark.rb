class Bookmark < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, presence: true, uniqueness: {scope: :post_id} 
  validates :post_id, presence: true
end