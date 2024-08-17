# frozen_string_literal: true

module NotificationsHelper
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
