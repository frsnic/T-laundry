class UserPolicy < ApplicationPolicy

  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:group_users).where(group_users: { group_id: user.groups.pluck(:id) })
      end
    end

  end

end
