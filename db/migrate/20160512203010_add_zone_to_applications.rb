class AddZoneToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :zone, :string
  end
end
