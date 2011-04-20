class User < ActiveRecord::Base
  include Clearance::User

  def setup_test_user
    #Give the newly created test user some data
    completed = CompletedCourse.new
    completed.user = self
    completed.grade = "A+"
    csc116 = Course.where({:number => "116", :subject => "CSC"}).first
    completed.course = csc116
    completed.degree_requirement = DegreeRequirement.where({:required_id => csc116.id, :required_type => "Course"}).first
    completed.semester = Semester.all.first

    completed.save
  end
end
