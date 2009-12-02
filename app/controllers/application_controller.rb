# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'application'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :choose_semester
  before_filter :load_schedule

  def choose_semester
  	if session[:semester].nil? && !choosing_semester? && !request.xhr? # don't redirect on AJAX req's
  		redirect_to :controller => :semesters, :action => :index
  	end
  end

  def choosing_semester?
    /semester/.match(request.request_uri)
  end

  def load_schedule
    # returns [] when session[:semester].nil?
    @registered_sections ||= RegisteredSection.all(:joins => :section,
                                                   :conditions => { 'sections.semester_id' => session[:semester] })
  end

end
