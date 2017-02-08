class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]
  before_action :set_users, only: [:new, :create, :edit]

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
    @members, @users =  @users.partition { |u| @group.users.include?(u) }
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'group更新に成功しました'
    else
      redirect_to edit_group_path(@group), alert: 'group更新に失敗しました'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_users
    @users = User.where.not(id: current_user)
  end
end
