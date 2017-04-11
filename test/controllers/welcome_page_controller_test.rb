require 'test_helper'

class WelcomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get welcome_page_welcome_url
    assert_response :success
  end

end
