class CommentPolicy < ApplicationPolicy

  def destroy?
    user.present?
  end

end