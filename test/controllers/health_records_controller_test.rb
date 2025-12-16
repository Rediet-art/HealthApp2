require "test_helper"

class HealthRecordsControllerTest < ActionDispatch::IntegrationTest
 setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get health_records_url
    assert_response :success
  end

  test "should get new" do
    get new_health_record_url
    assert_response :success
  end

  test "should create health record" do
    assert_difference("HealthRecord.count", 1) do
      post health_records_url, params: {
        health_record: {
          weight: 70,
          heart_rate: 72,
          notes: "Test record"
        }
      }
    end

    assert_redirected_to health_records_url
  end
end
