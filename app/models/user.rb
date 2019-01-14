class User < ApplicationRecord
  
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :following,             through:     :active_relationships,
                                   source:      :followed
  has_many :followers,             through:     :passive_relationships 
  has_many :posts,                 dependent:   :destroy
  has_many :likes,                 dependent:   :destroy
  has_many :comments,              dependent:   :destroy
  has_many :bookmarks,             dependent:   :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[twitter]

  validates :name, presence: true, length: {maximum: 50}

  def self.search(term)
    where('name LIKE ?', "%#{term}%")
  end

  def follow(other_user)
    following << other_user
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(other_user)
    following.include?(other_user)
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name     = auth.info.name
      user.image    = auth.info.image
      user.uid      = auth.uid
      user.provider = auth.provider
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
