class Account::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!

  def index
    @stores = policy_scope(Store).order('group_id ASC')
  end

end
