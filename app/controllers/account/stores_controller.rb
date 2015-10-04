class Account::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!

  def index
    @stores = policy_scope(Store).includes(:store_managers, :group, cloths: :wash_ways).order('group_id ASC')
  end

end
