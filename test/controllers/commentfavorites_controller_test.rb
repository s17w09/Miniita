require "test_helper"

class CommentfavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get commentfavorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get commentfavorites_destroy_url
    assert_response :success
  end
end
