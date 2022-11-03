class UserPolicy < ApplicationPolicy
  
  class Scope < Scope
    def resolve
      if user.superuser?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    user.superuser? 
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    user.superuser?
  end
 
end