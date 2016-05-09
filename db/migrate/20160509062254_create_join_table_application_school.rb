class CreateJoinTableApplicationSchool < ActiveRecord::Migration
  def change
    create_join_table :applications, :schools do |t|
      t.index [:application_id, :school_id]
      t.index [:school_id, :application_id]
    end
  end
end
