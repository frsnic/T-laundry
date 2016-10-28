class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!, except: [:show]
  before_action :find_store_and_group

  def show
    @order = @store.orders.find(params[:id])
  end

  def new
    @order = @store.orders.new
    @order.client = find_client(params[:client_id])
    @cloths = @store.cloths.includes(:wash_ways)
  end

  def create
    @order = @store.orders.build(order_params)
    @order.user_id = current_user.id
    @order.client  = find_client(@order.client_id)

    if @order.save
      redirect_to store_order_path(@store, @order), notice: '新增訂單成功'
    else
      render :new
    end
  end

  def edit
    @order = @store.orders.find(params[:id])
  end

  def update
    @order = @store.orders.find(params[:id])
    @order.client = find_client(@order.client_id)

    if @order.update(order_params)
      redirect_to store_order_path(@store, @order), notice: "修改訂單成功"
    else
      render :edit
    end
  end

  def destroy
    @order = @store.orders.find(params[:id])

    @order.destroy
    redirect_to group_store_path(@group, @store), alert: "訂單已刪除"
  end

  private

  def order_params
    params.require(:order).permit(:client_id, :price,
      order_items_attributes: [:id, :cloth_title, :price, :_destroy])
  end

  def find_store_and_group
    @store = policy_scope(Store).find(params[:store_id])
    @group = @store.group
  end

  def find_client(client_id)
    @client = @store.clients.find(client_id)
  end

end
