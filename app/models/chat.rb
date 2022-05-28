class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy

  def create_notification_chat!(current_user, chat_id)
    temp_ids = Chat.select(:user_id).where(room_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_chat!(current_user, chat_id, temp_id['user_id'])
    end
    save_notification_chat!(current_user, chat_id, user_id) if temp_ids.blank?
  end

  def save_notification_chat!(current_user, chat_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      room_id: id,
      chat_id: chat_id,
      visited_id: visited_id,
      action: 'chat'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
