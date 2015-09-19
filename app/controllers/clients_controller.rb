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

  private

  def client_params
    params.require(:client).permit(:name, :phone, :address)
  end

  def find_store
    @store = policy_scope(Store).find(params[:store_id])
  end

end
