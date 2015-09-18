class StorePolicy < ApplicationPolicy

  def stores
    if user.admin?
      Store.all
    elsif user.group_manager?
      Store.where(group_id: user.groups.pluck(:id))
    else
      user.stores
    end
  end

  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      elsif user.group_manager?
        scope.where(group_id: user.groups.pluck(:id))
      else
        user.stores
      end
    end

  end

end
