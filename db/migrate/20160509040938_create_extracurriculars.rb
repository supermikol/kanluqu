class CreateExtracurriculars < ActiveRecord::Migration
  def change
    create_table :extracurriculars do |t|
      t.belongs_to :application
      t.string :name
      t.string :category
      t.string :position
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
