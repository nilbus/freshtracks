class RenamePassedCoursesToCompletedCourses < ActiveRecord::Migration
  def self.up
    rename_table :passed_courses, :completed_courses
  end

  def self.down
    rename_table :completed_courses, :passed_courses
  end
end
