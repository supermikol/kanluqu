class AddDurationToExtracurriculars < ActiveRecord::Migration
  def change
    add_column :extracurriculars, :duration, :integer
  end
end
