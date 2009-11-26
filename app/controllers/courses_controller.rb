class CoursesController < ApplicationController
  #autocomplete_for :searchkey

  # search courses; returns matching
  # Currently only uses one search term
  def index
    begin
                                           # sqlite query
      @courses = Course.all(:conditions => ['(courses.subject || courses.number || " - " || courses.name) LIKE ?',
                                            
                                            '%' + params[:search] + '%'],
                            #:joins => :sections,
                            :order => "courses.subject || courses.number")
    rescue TypeError # when params[:search].nil?
      # Don't search for courses if they haven't searched for them
      # The view should display instructions if @courses.nil?
      # and show that there were no results  if @courses.empty?
      @courses = nil
    end
  end

end
