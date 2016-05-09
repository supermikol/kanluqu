class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.belongs_to :application, index: true
      t.belongs_to :prompt, index: true
      t.string :category
      t.text :content

      t.timestamps null: false
    end
  end
end
