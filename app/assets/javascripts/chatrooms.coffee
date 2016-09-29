message_submission_hooked = ->
  $('#new_message').on 'submit', (e) ->
    e.preventDefault()
    chatroom_id = $("#message_chatroom_id").val()
    message = $("#message_body")
    App.chatrooms.send_message_to_channel_js(chatroom_id, message.val())
    message.val('')

$(document).on "turbolinks:load", ->
  message_submission_hooked()
