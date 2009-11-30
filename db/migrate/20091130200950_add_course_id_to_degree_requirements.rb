class AddCourseIdToDegreeRequirements < ActiveRecord::Migration
  def self.up
    add_column :degree_requirements, :course_id, :integer
    DegreeRequirement.all.each{|s|s.update_attribute :course_id, s.class_id}
    remove_column :degree_requirements, :class_id
  end

  def self.down
    add_column :degree_requirements, :class_id, :integer
    DegreeRequirement.all.each{|s|s.update_attribute :class_id, s.course_id}
    remove_column :degree_requirements, :course_id
  end
end
