class AddCourseIdToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :course_id, :integer
    Section.all.each{|s|s.update_attribute :course_id, s.class_id}
    remove_column :sections, :class_id
  end

  def self.down
    add_column :sections, :class_id, :integer
    Section.all.each{|s|s.update_attribute :class_id, s.course_id}
    remove_column :sections, :course_id
  end
end
