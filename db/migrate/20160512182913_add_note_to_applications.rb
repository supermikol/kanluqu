class AddNoteToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :note, :text
  end
end
