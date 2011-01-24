class SemestersController < ApplicationController
  # list upcoming semesters available for registration
  before_filter :authenticate
  def index
    @semesters = Semester.all(:order => "updated_at")
  end
  
  def show
  	session[:semester] = params[:id]
  	redirect_to "/"
  end

end
