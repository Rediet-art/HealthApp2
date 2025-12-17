require "test_helper"

class HealthRecordTest < ActiveSupport::TestCase
  test "valid health record" do
    user = User.create!(
      email: "test@example.com",
      password: "password123"
    )

    record = HealthRecord.new(
      user: user,
      recorded_on: Date.today,
      weight: 70,
      heart_rate: 72
    )

    assert record.valid?
  end
end
