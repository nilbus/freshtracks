class CoursesController < ApplicationController
  #autocomplete_for :searchkey

  # search courses; returns matching
  # Currently only uses one search term
  def index
  	if(session[:semester].nil?)
  		redirect_to :controller => :semester, :action => :index
  	end
  
  	if (params[:search].nil?)
  		filter = ''
  	else
  		filter = params[:search]
  	end	
  	
    @courses = Course.all(:conditions => ['(subject || number || " - " || name) LIKE ?', '%' + filter + '%'])
  end

end
