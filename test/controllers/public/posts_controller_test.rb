require 'test_helper'

class Public::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_posts_index_url
    assert_response :success
  end

  test "should get index_top" do
    get public_posts_index_top_url
    assert_response :success
  end

  test "should get new" do
    get public_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get public_posts_show_url
    assert_response :success
  end

  test "should get create" do
    get public_posts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_posts_destroy_url
    assert_response :success
  end

end
