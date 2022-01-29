require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get types_index_url
    assert_response :success
  end

  test "should get show" do
    get types_show_url
    assert_response :success
  end

  test "should get edit" do
    get types_edit_url
    assert_response :success
  end

  test "should get new" do
    get types_new_url
    assert_response :success
  end

end
