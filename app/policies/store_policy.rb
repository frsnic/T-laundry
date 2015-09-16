class StorePolicy < ApplicationPolicy

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
