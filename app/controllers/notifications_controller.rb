# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    # current_userが受け取った（passive_notification）の通知
    @notifications = current_user.passive_notifications.page(params[:page])
    # notificationの中でまだしていない通知のみ取り出す
    @notifications.where(checked: false).find_each do |notification|
      notification.update(checked: true)
    end
  end

  def destroy
    @notifications = current_user.notifications.destroy_all
    redirect_to notifications_path
  end
end
