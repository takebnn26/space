class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'group作成に成功しました'
    else
      flash.alert = 'group作成に失敗しました'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
