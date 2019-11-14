require 'test_helper'

class Public::StadiumControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_stadium_show_url
    assert_response :success
  end

  test "should get index" do
    get public_stadium_index_url
    assert_response :success
  end

  test "should get create" do
    get public_stadium_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_stadium_destroy_url
    assert_response :success
  end

end
