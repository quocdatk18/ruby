class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new message_params
    if @message.save
      flash[:success] = 'Message is created'
      MessageBroadcastJob.perform_now(@message, user: current_user)
    else
      flash.now[:danger] = 'Something wrong'
    end
  end

  private

  def message_params
    params.permit(:content, :room_id)
  end
end
