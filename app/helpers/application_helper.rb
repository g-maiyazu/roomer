module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'ROOMER'
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def date_format(datetime)
    time_ago_in_words(datetime) + '前'
  end

  # 通知表示のためのメッセージを返す
  def notification_form(notification)
    case notification.action
    when 'follow'
      'さんがあなたをフォローしました'
    when 'like'
      'さんがあなたの投稿に「いいね！」しました'
    end
  end

  # 未確認の通知を確認する
  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end
end
