class AddDescriptionToExtracurriculars < ActiveRecord::Migration
  def change
    add_column :extracurriculars, :description, :text
  end
end
