class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: [:create]

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    message.save
    MessageJob.perform_later(message)
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:message][:chatroom_id])
    end

    def message_params
      params.require(:message).permit(:body, :chatroom_id)
    end
end
