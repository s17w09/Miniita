# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to root_path
  end
end
