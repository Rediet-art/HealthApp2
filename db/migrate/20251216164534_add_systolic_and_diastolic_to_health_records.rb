class AddSystolicAndDiastolicToHealthRecords < ActiveRecord::Migration[8.1]
  def change
    add_column :health_records, :systolic, :integer
    add_column :health_records, :diastolic, :integer
  end
end
