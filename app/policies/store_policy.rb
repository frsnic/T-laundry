class StorePolicy < ApplicationPolicy

  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        user.stores
      end
    end

  end

end
