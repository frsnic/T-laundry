class Account::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!

  def index
    @groups = policy_scope(Group)
  end

end
