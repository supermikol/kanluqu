class AddNoteToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :note, :string
  end
end
