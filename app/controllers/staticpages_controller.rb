# frozen_string_literal: true

class StaticpagesController < ApplicationController
  skip_before_action :require_login
  def top; end
end
