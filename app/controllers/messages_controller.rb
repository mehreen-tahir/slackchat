class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: [:create]

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    respond_to do |format|
      if message.save
        format.html { redirect_to @chatroom, notice: 'Message added to chat.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:message][:chatroom_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
