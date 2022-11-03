class UserSessionPolicy < ApplicationPolicy

  def create?
    true
  end

  def new?
    create?
  end

  def destroy?
    create?
  end
end
