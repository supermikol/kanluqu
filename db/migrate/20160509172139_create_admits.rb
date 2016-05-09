class CreateAdmits < ActiveRecord::Migration
  def change
    create_table :admits do |t|
      t.references :school
      t.references :application
      t.boolean :admitted

      t.timestamps null: false
    end
  end
end
