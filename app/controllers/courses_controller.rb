class CoursesController < ApplicationController
  #autocomplete_for :searchkey

  # search courses; returns matching
  # Currently only uses one search term
  def index
  	if (params[:search].nil?)
  		filter = ''
  	else
  		filter = params[:search]
  	end	
  	
    @courses = Course.all(:conditions => ['(subject || number || " - " || name) LIKE ?', '%' + filter + '%'])
  end

end
