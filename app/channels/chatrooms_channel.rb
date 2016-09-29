class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatroom_#{chatroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message_to_server_channel(data)
    @chatroom = Chatroom.find(data['chatroom_id'])
    message = @chatroom.messages.create(body: data['message'], user: current_user)
    MessageJob.perform_later(message)
  end
end
