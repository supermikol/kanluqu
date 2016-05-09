class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.references :favoritable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
