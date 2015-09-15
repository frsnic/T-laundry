class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

end
