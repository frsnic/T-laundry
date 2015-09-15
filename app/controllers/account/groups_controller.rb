class Account::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:index]

  def index
    authorize Group, :manager?
    @groups = policy_scope(Group)
  end

end
