class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!, except: [:show]
  before_action :find_store

  def index
    @clients = @store.clients
  end

  def show
    @client = @store.clients.find(params[:id])
  end

  def new
    @client = @store.clients.new
  end

  def create
    @client = @store.clients.build(client_params)

    if @client.save
      redirect_to store_client_path(@store, @client), notice: '新增客戶成功'
    else
      render :new
    end
  end

  def edit
    @client = @store.clients.find(params[:id])
  end

  def update
    @client = @store.clients.find(params[:id])

    if @client.update(client_params)
      redirect_to store_client_path(@store, @client), notice: "修改客戶成功"
    else
      render :edit
    end
  end

  def destroy
    @client = @store.clients.find(params[:id])

    @client.destroy
    redirect_to store_clients_path(@store), alert: "客戶已刪除"
  end

  def held
    @client = @store.clients.find(params[:id])
    @finished_items = @client.order_items.where(status: OrderItem.statuses[:finish]).order(:order_id, :id)
    @nofinish_items = @client.order_items.where.not(status: OrderItem.statuses[:finish]).order('status, fetched_at desc, id')
  end

  def fetch
    @client = @store.clients.find(params[:id])
    array = []
    (params[:items] || []).each_with_index {|item, index| array << item.to_i }
    @items = (@client.order_items.pluck(:id)) & array
    OrderItem.where(id: @items).update_all(status: OrderItem.statuses[:out], fetched_at: Time.now())

    redirect_to held_store_client_path(@store, @client), notice: "取件成功"
  end

  private

  def client_params
    params.require(:client).permit(:name, :phone, :address, :balance)
  end

  def find_store
    @store = policy_scope(Store).find(params[:store_id])
  end

end
