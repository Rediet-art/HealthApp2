class HealthController < ApplicationController
  before_action :authenticate_user!

  def index
    @health_records = current_user.health_records.order(recorded_on: :desc)

    if @health_records.any?
      latest = @health_records.first

      @summary = {
        total_records: @health_records.count,
        latest_weight: latest.weight,
        avg_heart_rate: @health_records.average(:heart_rate)&.round(1),
        last_bp: if latest.respond_to?(:systolic) && latest.systolic && latest.diastolic
                   "#{latest.systolic}/#{latest.diastolic}"
                 else
                   "N/A"
                 end,
        last_date: latest.recorded_on
      }
    end
  end
end

