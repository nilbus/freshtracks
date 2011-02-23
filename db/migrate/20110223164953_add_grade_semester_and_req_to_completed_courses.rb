class AddGradeSemesterAndReqToCompletedCourses < ActiveRecord::Migration
  def self.up
    add_column :completed_courses, :grade, :string
    add_column :completed_courses, :semester_id, :integer
    add_column :completed_courses, :degree_requirement_id, :integer
  end

  def self.down
    remove_column :completed_courses, :degree_requirement_id
    remove_column :completed_courses, :semester_id
    remove_column :completed_courses, :grade
  end
end
