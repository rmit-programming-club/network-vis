require 'test_helper'

class OrganizationControllerTest < ActionDispatch::IntegrationTest
  test "should get organizations page" do
    get organizations_index_url
    assert_response :success

  end

end
