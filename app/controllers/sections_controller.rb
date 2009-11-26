class SectionsController < ApplicationController
  # sections for current semester
  def index
    @sections = Section.all(:order => "course_id") #(:conditions => ['semester_id = ', session[:semester]])
  end
end
