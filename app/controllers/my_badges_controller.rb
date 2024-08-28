class MyBadgesController < ApplicationController
  def index
    @first_article = current_user.first_published
    @third_article = current_user.third_published
    @fifth_article = current_user.fifth_published
    @tenth_article = current_user.tenth_published
    @twentieth_article = current_user.twentieth_published
    @thirtieth_article = current_user.thirtieth_published
  end
end
