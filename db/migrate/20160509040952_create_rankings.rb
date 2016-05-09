class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.belongs_to :school
      t.integer :rank
      t.integer :year

      t.timestamps null: false
    end
  end
end
