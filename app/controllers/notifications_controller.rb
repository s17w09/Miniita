# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    # current_userの投稿に紐づいた通知一覧
    @notifications = current_user.passive_notifications.page(params[:page])
    # notificationの中でまだしていない通知のみ取り出す
    @notifications.where(checked: false).find_each do |notification|
      notification.update(checked: true)
    end
  end
end
