class PostPolicy < ApplicationPolicy

  def index?
    true    
  end

  def destroy?
    #deze method staat uitgelegd in applcation_policy
    user.present? && can_moderate?
  end

  def edit?
  end 

end