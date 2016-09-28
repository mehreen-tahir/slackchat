module ChatroomsHelper
  def chatroom_link(chatroom)
    link_name = chatroom.user_added?(current_user) ? 'Leave' : 'Join'
    link_path = chatroom.user_added?(current_user) ? leave_chatroom_path(chatroom) : join_chatroom_path(chatroom)
    link_to link_name, link_path, method: :post
  end
end
