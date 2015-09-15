class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      current_user.join!(@group)
      redirect_to groups_path, notice: '新增群組成功'
    else
      render :new
    end
  end

  def update
    @group = current_user.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: "修改群組成功"
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])

    @group.destroy
    redirect_to groups_path, alert: "群組已刪除"
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

end
