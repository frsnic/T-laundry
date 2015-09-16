class Account::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:index, :manager_list]

  def index
    authorize Group, :manager?
    @groups = policy_scope(Group)
  end

  def manager_list
    authorize Group, :group_manager?
    @groups = policy_scope(Group)
  end

end
