class CreatePassedCourses < ActiveRecord::Migration
  def self.up
    create_table :passed_courses do |t|
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :passed_courses
  end
end
