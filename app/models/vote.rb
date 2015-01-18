class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_post

  private

  def update_post
    #je roep hier dus een method aan in de post!
    post.update_rank
  end
  
end
