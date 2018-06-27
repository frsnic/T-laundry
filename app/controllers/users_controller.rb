class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user.id == params[:id].to_i ? current_user : 'not you'
  end

end
