class HealthRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_health_record, only: %i[show edit update destroy]


  def index
    @health_records = current_user.health_records
  end

  def new
    @health_record = current_user.health_records.new
  end

  def create
    @health_record = current_user.health_records.new(health_record_params)

    if @health_record.save
      redirect_to root_path, notice: "Health record added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end
def show
  # @health_record is already set by before_action
end

  def edit
  end

  def update
    if @health_record.update(health_record_params)
      redirect_to root_path, notice: "Health record updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @health_record.destroy
    redirect_to root_path, notice: "Health record deleted."
  end

  private

  def set_health_record
    @health_record = current_user.health_records.find(params[:id])
  end

  def health_record_params
    params.require(:health_record).permit(
      :recorded_on,
      :weight,
      :systolic,
      :diastolic,
      :heart_rate,
      :notes
    )
  end
end
