class CreateHealthRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :health_records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :recorded_on
      t.decimal :weight
      t.string :blood_pressure
      t.integer :heart_rate
      t.text :notes

      t.timestamps
    end
  end
end
