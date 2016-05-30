class RemoveEndDateFromExtracurriculars < ActiveRecord::Migration
  def change
    remove_column :extracurriculars, :end_date, :date
  end
end
