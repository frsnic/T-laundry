class ClothsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!, except: [:show]
  before_action :find_store

  def show
    @cloth = @store.cloths.includes(:wash_ways, store: :group).find(params[:id])
  end

  def new
    @cloth = @store.cloths.new
    3.times { @cloth.wash_ways.build }
    @cloth.wash_ways[0].title = "水洗"
    @cloth.wash_ways[1].title = "乾洗"
    @cloth.wash_ways[2].title = "熨燙"
  end

  def create
    @cloth = @store.cloths.build(cloth_params)

    if @cloth.save
      redirect_to store_cloth_path(@store, @cloth), notice: '新增衣服種類成功'
    else
      render :new
    end
  end

  def edit
    @cloth = @store.cloths.find(params[:id])
  end

  def update
    @cloth = @store.cloths.find(params[:id])

    if @cloth.update(cloth_params)
      redirect_to store_cloth_path(@store, @cloth), notice: "修改衣服種類成功"
    else
      render :edit
    end
  end

  def destroy
    @cloth = @store.cloths.find(params[:id])

    @cloth.destroy
    redirect_to account_stores_path, alert: "衣服種類已刪除"
  end

  private

  def cloth_params
    params.require(:cloth).permit(:title,
      wash_ways_attributes: [:id, :title, :price, :_destroy])
  end

  def find_store
    @store = policy_scope(Store).find(params[:store_id])
  end

end

