class AddDetailToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :detail, :text
  end
end
