class StoreManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!
  before_action :find_store

  def show
    @manager = @store.store_managers.find(params[:id])
  end

  def new
    @manager = @store.store_managers.new
  end

  def create
    @manager = @store.store_managers.build(user_params)
    @manager.role = User.roles[:store_manager]

    if @manager.save
      @store.store_managers << @manager
      redirect_to account_stores_path, notice: '新增商店管理員成功'
    else
      render :new
    end
  end

  def edit
    @manager = @store.store_managers.find(params[:id])
  end

  def update
    @manager = @store.store_managers.find(params[:id])

    if @manager.update(user_params)
      redirect_to account_stores_path, notice: "修改商店管理員成功"
    else
      render :edit
    end
  end

  def destroy
    @manager = @store.store_managers.find(params[:id])

    @manager.destroy
    redirect_to account_stores_path, alert: "商店管理員已刪除"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_store
    @store = policy_scope(Store).find(params[:store_id])
    @group = @store.group
  end

end
