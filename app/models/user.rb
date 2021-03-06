class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :votes
  has_many :favorites, dependent: :destroy

  def voted(post)
     votes.where(post_id: post.id).first
   end


  def admin?
    role == 'admin'
  end

  def moderator?
    role = 'moderator'
  end

  def favorited(post)
    favorites.where(post_id: post.id).first
  end
end
