# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    # current_userが受け取った（passive_notification）の通知
    @notifications = current_user.passive_notifications.page(params[:page]).per(13)
    # notificationの中でまだしていない通知のみ取り出す
    @notifications.where(checked: false).find_each do |notification|
      notification.update(checked: true)
    end
  end
end
