unread_messages = 0
App.chatrooms = App.cable.subscriptions.create 'ChatroomsChannel',
  connected: ->
  disconnected: ->
  received: (data) ->
    specific_chatroom_messages = $("[data-chatroom-id='#{data.chatroom_id}'][data-behaviour='messages']")
    if specific_chatroom_messages.length > 0
      specific_chatroom_messages.append data.message
    else
      unread_messages = unread_messages + 1
      specific_chatroom_link = $("[data-behaviour='user-chatrooms'][data-chatroom-id='#{data.chatroom_id}']")
      specific_chatroom_link.css('font-weight', 'bold')
      specific_chatroom_link.find('span').text(unread_messages)

  send_message_to_channel_js: (chatroom_id, message) ->
    @perform "send_message_to_server_channel", { chatroom_id: chatroom_id, message: message }
