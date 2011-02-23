class CompletedCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :semester
  belongs_to :degree_requirement
  belongs_to :course
  
end
