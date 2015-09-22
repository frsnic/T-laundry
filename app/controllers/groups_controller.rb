class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:show]

  def show
    authorize Group, :manager?
    @group = policy_scope(Group).find(params[:id])
  end

  def new
    @group = policy_scope(Group).new
  end

  def create
    @group = policy_scope(Group).new(group_params)

    if @group.save
      redirect_to account_groups_path, notice: '新增群組成功'
    else
      render :new
    end
  end

  def edit
    @group = policy_scope(Group).find(params[:id])
  end

  def update
    @group = policy_scope(Group).find(params[:id])

    if @group.update(group_params)
      redirect_to account_groups_path, notice: "修改群組成功"
    else
      render :edit
    end
  end

  def destroy
    @group = policy_scope(Group).find(params[:id])

    @group.destroy
    redirect_to account_groups_path, alert: "群組已刪除"
  end

  private

  def group_params
    params.require(:group).permit(:title, :precision)
  end

end
