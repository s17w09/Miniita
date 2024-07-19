# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'miniita.info@gmail.com'
  layout 'mailer'
end
