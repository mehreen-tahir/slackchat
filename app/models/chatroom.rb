class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages

  validates :name, presence: true

  def add_chatroom_user(user)
    self.chatroom_users.where(user_id: user.id).first_or_create
  end

  def remove_chatroom_user(user)
    self.chatroom_users.where(user_id: user.id).destroy_all
  end

  def user_added?(user)
    self.chatroom_users.pluck(:user_id).include?(user.id) if user.present?
  end

  def titleize_name
    self.name.titleize
  end
end
