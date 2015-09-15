class GroupPolicy < ApplicationPolicy

  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        user.groups
      end
    end

  end

end
