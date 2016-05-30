class RemoveDateFromTestScores < ActiveRecord::Migration
  def change
    remove_column :test_scores, :date, :date
  end
end
