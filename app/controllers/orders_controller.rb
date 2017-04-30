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
  end

  # {
  #              "id" => 41,
  #        "store_id" => 1,
  #       "client_id" => 1,
  #           "price" => 123.0,
  #         "user_id" => 1,
  #     "order_items" => [
  #         [0] #<OrderItem:0x007ffa58c2b500> {
  #                      :id => 113,
  #                :order_id => 41,
  #             :category_id => 22,
  #        :category_item_id => 33,
  #                   :price => 123.0,
  #                  :status => "processing",
  #              :fetched_at => nil,
  #                :wash_way => "水洗"
  #         }
  #     ]
  # }
  def create
    @order = @store.orders.build(order_params)
    @order.user_id = current_user.id
    @order.client  = find_client(@order.client_id)

    if @order.save
      respond_to do |format|
        format.html { redirect_to store_order_path(@store, @order), notice: '新增訂單成功' }
        format.json { render json: @order, is_success: true }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @order, is_success: false }
      end
    end
  end

  def edit
    @order = @store.orders.find(params[:id])
  end

  def update
    @order = @store.orders.find(params[:id])
    @order.client = find_client(@order.client_id)

    if @order.save
      respond_to do |format|
        format.html { redirect_to store_order_path(@store, @order), notice: '修改訂單成功' }
        format.json { render json: @order, is_success: true }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @order, is_success: false }
      end
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
