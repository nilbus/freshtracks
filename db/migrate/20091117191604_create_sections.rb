class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :class_id
      t.integer :semester_id
      t.string :room
      t.string :professor
      t.string :number
      t.time :begin_time
      t.time :end_time
      t.string :days
      t.integer :seats

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
