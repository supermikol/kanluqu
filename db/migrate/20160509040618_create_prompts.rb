class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.belongs_to :school
      t.text :content
      t.integer :year

      t.timestamps null: false
    end
  end
end
