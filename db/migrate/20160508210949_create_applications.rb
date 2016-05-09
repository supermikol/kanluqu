class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.belongs_to :user, index: true
      t.string :student_name
      t.string :major
      t.string :location
      t.string :gender
      t.integer :year
      t.boolean :study_abroad

      t.timestamps null: false
    end
  end
end
