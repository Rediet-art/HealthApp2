require "test_helper"

class HealthRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get health_records_index_url
    assert_response :success
  end

  test "should get new" do
    get health_records_new_url
    assert_response :success
  end

  test "should get create" do
    get health_records_create_url
    assert_response :success
  end
end
