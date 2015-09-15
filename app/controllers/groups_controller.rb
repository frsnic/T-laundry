class GroupsController < ApplicationController

  def index
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to account_groups_path, notice: '新增群組成功'
    else
      render :account_new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
    authorize @group
  end

  def update
    @group = current_user.groups.find(params[:id])
    authorize @group

    if @group.update(group_params)
      redirect_to account_groups_path, notice: "修改群組成功"
    else
      render :account_edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])

    @group.destroy
    redirect_to account_groups_path, alert: "群組已刪除"
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end

end
