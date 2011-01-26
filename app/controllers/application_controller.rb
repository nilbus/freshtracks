class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  layout proc { |controller| controller.request.xhr? ? nil : 'mypackportal' }

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :authenticate
  before_filter :choose_semester
  before_filter :load_schedule

  def choose_semester
  	if session[:semester].nil? && !login_or_choosing_semester? && !request.xhr? # don't redirect on AJAX req's
  		redirect_to :controller => :semesters, :action => :index
  	end
  end

  def login_or_choosing_semester?
    /semester|sign_in/.match(request.fullpath)
  end

  def load_schedule
    @registered_sections ||= RegisteredSection.all(:joins => :section,
                                                   :conditions => { 'sections.semester_id' => session[:semester] })
    # returns [] when session[:semester].nil?
  end

end
