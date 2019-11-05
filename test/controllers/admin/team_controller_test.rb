require 'test_helper'

class Admin::TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_team_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_team_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_team_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_team_destroy_url
    assert_response :success
  end

  test "should get update" do
    get admin_team_update_url
    assert_response :success
  end

end
