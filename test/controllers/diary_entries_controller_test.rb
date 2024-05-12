require "test_helper"

class DiaryEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diary_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get diary_entries_create_url
    assert_response :success
  end

  test "should get show" do
    get diary_entries_show_url
    assert_response :success
  end
end
