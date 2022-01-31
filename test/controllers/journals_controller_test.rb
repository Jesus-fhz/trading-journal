require 'test_helper'

class JournalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get journals_new_url
    assert_response :success
  end

  test "should get create" do
    get journals_create_url
    assert_response :success
  end

  test "should get show" do
    get journals_show_url
    assert_response :success
  end

  test "should get edit" do
    get journals_edit_url
    assert_response :success
  end

  test "should get update" do
    get journals_update_url
    assert_response :success
  end

  test "should get create" do
    get journals_create_url
    assert_response :success
  end

  test "should get index" do
    get journals_index_url
    assert_response :success
  end

end
