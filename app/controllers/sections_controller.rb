class SectionsController < ApplicationController
  # sections for current semester
  def index
    @sections = Section.all(:order => "course_id") #(:conditions => ['semester_id = ', session[:semester]])
  end
  
  def wishlist_add
  
  end
  
  def schedule_add
  
  end
end
