require "test_helper"

class StudySessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get study_sessions_index_url
    assert_response :success
  end

  test "should get create" do
    get study_sessions_create_url
    assert_response :success
  end

  test "should get update" do
    get study_sessions_update_url
    assert_response :success
  end
end
