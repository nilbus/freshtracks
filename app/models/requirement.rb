class Requirement < ActiveRecord::Base
  belongs_to :course, :class_name => 'Course', :foreign_key => 'course_id'
  belongs_to :needs, :class_name => 'Course', :foreign_key => 'needs_id'
end
