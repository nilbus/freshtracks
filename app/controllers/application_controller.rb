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
    if signed_in? && !choosing_semester? && !request.xhr?
      if session[:semester].nil?
        redirect_to semesters_path
      else
        begin
          @current_semester = Semester.find(session[:semester])
        rescue
          session[:semester] = nil
          redirect_to semesters_path
        end
      end
    end
  end

  def choosing_semester?
    /semester/.match(request.fullpath)
  end

  def load_schedule
    return unless signed_in?

    # returns [] when session[:semester].nil?
    @registered_sections ||= RegisteredSection.all(:joins => :section,
                                                   :conditions => { 'sections.semester_id' => session[:semester], :user_id => current_user.id })
  end

end
