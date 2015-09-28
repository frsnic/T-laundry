class Account::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_group_manager!

  def index
    @groups = policy_scope(Group).includes(:group_managers, :cloths)
  end

end
