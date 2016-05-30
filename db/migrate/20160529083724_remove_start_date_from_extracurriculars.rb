class RemoveStartDateFromExtracurriculars < ActiveRecord::Migration
  def change
    remove_column :extracurriculars, :start_date, :date
  end
end
