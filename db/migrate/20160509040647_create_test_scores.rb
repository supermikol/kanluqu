class CreateTestScores < ActiveRecord::Migration
  def change
    create_table :test_scores do |t|
      t.belongs_to :application
      t.string :category
      t.string :subject
      t.integer :score
      t.date :date

      t.timestamps null: false
    end
  end
end
