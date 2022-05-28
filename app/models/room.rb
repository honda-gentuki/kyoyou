class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :chats

  def create_notification_chat!(current_user, chat_id)
    temp_ids = Chat.select(:user_id).where(room_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_chat!(current_user, chat_id, temp_id['user_id'])
    end
    save_notification_chat!(current_user, chat_id, user_id) if temp_ids.blank?
  end

  def save_notification_chat!(current_user, chat_id, visited_id)
    notification = current_user.active_notifications.new(
      room_id: id,
      chat_id: chat_id,
      visited_id: visited_id,
      action: 'chat'
    )
    notification.checked = true if notification.visiter_id == notification.visited_id
    notification.save if notification.valid?
  end
end
