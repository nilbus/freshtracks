class CreatePassedClasses < ActiveRecord::Migration
  def self.up
    create_table :passed_classes do |t|
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :passed_classes
  end
end
