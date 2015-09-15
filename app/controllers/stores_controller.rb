class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!
  before_action :find_group

  def show
    @store = @group.stores.find(params[:id])
  end

  def new
    @store = @group.stores.new
  end

  def create
    @store = @group.stores.new(store_params)

    if @store.save
      redirect_to account_stores_path, notice: '新增商店成功'
    else
      render :account_new
    end
  end

  def edit
    @store = @group.stores.find(params[:id])
  end

  def update
    @store = @group.stores.find(params[:id])

    if @store.update(store_params)
      redirect_to account_stores_path, notice: "修改商店成功"
    else
      render :account_edit
    end
  end

  def destroy
    @store = @group.stores.find(params[:id])

    @store.destroy
    redirect_to account_stores_path, alert: "商店已刪除"
  end

  private

  def store_params
    params.require(:store).permit(:title)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

end
