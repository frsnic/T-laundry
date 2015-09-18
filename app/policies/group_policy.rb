class GroupPolicy < ApplicationPolicy

  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      elsif user.group_manager?
        user.groups
      else
        scope.where(id: user.stores.pluck(:group_id))
      end
    end

  end

end
