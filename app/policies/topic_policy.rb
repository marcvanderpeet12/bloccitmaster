class TopicPolicy < ApplicationPolicy

  def index?
    true   
  end

  def show?
    record.public? || user.present?
  end

  def create?
    user.present? && user.admin?
  end

  def update?
    create?
  end

  #je zegt dus indirect dat je de create voorwaarden wilt gebruiken -> destroy -> update -> create
  def destroy?
    update?
  end

  def edit
    
  end

end