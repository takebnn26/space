class Groups::MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @groups   = current_user.groups
    @messages = current_user.messages
    @message  = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージ送信成功'
    else
      redirect_to group_messages_path(@group), alert: 'メッセージ送信失敗'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: @group.id)
  end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end
end
