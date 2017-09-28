require 'test_helper'

class AbcControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get abc_create_url
    assert_response :success
  end

end
