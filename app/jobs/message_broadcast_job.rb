class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, user)
    ActionCable.server.broadcast('chats_channel', { message: render_message(message, user) })
  end

  private

  def render_message(message, _user)
    @mgs = {
      id: message.id,
      content: message.content,
      created_at: message.created_at.to_s(:short),
      updated_at: message.updated_at.to_s(:short),
      room_id: message.room_id,
      user_id: message.user_id
    }
    MessagesController.render json: @mgs
  end
end
