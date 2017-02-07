class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'group作成に成功しました'
    else
      flash.now[:alert] = 'group作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'group更新に成功しました'
    else
      flash.now[:alert] = 'group更新に失敗しました'
      redirect_to edit_group_path(@group), alert: 'group更新に失敗しました'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
