class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :group

    def resolve
      scope
    end

    def initialize(user, group)
      @user  = user
      @group = group
    end

    def edit?
      user.admin?
    end

  end
end
