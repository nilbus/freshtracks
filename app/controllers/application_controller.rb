class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  layout proc { |controller| controller.request.xhr? ? nil : 'application' }

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :authenticate
  before_filter :choose_semester
  before_filter :load_schedule

  def choose_semester
    if signed_in? && 
       session[:semester].nil? && 
       !choosing_semester? && 
       !request.xhr? # don't redirect on AJAX req's
  	     redirect_to :controller => :semesters, :action => :index
  	end
  end

  def choosing_semester?
    /semester/.match(request.fullpath)
  end

  def load_schedule
    if !signed_in?
      return
    end

    # returns [] when session[:semester].nil?
    @registered_sections ||= RegisteredSection.all(:joins => :section,
                                                   :conditions => { 'sections.semester_id' => session[:semester], 'user_id' => current_user.id })
  end

end
