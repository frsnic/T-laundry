class GroupManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_group_manager!
  before_action :find_group

  def show
    @manager = @group.group_managers.find(params[:id])
  end

  def new
    @manager = @group.group_managers.new
  end

  def create
    @manager = @group.group_managers.build(user_params)
    @manager.role = User.roles[:group_manager]

    if @manager.save
      @group.group_managers << @manager
      redirect_to account_groups_path, notice: '新增群組管理員成功'
    else
      render :new
    end
  end

  def edit
    @manager = @group.group_managers.find(params[:id])
  end

  def update
    @manager = @group.group_managers.find(params[:id])

    if @manager.update(user_params)
      redirect_to account_groups_path, notice: "修改群組管理員成功"
    else
      render :edit
    end
  end

  def destroy
    @manager = @group.group_managers.find(params[:id])

    @manager.destroy
    redirect_to account_groups_path, alert: "群組管理員已刪除"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_group
    @group = policy_scope(Group).find(params[:group_id])
  end

end

