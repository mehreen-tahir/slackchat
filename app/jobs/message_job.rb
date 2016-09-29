class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    chatroom_id = message.chatroom.id
     ActionCable.server.broadcast "chatroom_#{chatroom_id}", {
      message: MessagesController.render(message),
      chatroom_id: chatroom_id,
      user_id: message.user_id
    }
  end
end
