class UserPolicy < ApplicationPolicy

  def index?
    user.admin_user?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
