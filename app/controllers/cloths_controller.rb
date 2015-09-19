class ClothsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!
  before_action :authorize_group_manager!, except: [:show]
  before_action :find_group

  def show
    @cloth = @group.cloths.find(params[:id])
  end

  def new
    @cloth = @group.cloths.new
  end

  def create
    @cloth = @group.cloths.build(cloth_params)

    if @cloth.save
      redirect_to group_cloth_path(@group, @cloth), notice: '新增衣服種類成功'
    else
      render :new
    end
  end

  def edit
    @cloth = @group.cloths.find(params[:id])
  end

  def update
    @cloth = @group.cloths.find(params[:id])

    if @cloth.update(cloth_params)
      redirect_to group_cloth_path(@group, @cloth), notice: "修改衣服種類成功"
    else
      render :edit
    end
  end

  def destroy
    @cloth = @group.cloths.find(params[:id])

    @cloth.destroy
    redirect_to account_groups_path, alert: "衣服種類已刪除"
  end

  private

  def cloth_params
    params.require(:cloth).permit(:title)
  end

  def find_group
    @group = policy_scope(Group).find(params[:group_id])
  end

end

