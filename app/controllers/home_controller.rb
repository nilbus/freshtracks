class HomeController < ApplicationController
  # skip all before_filters in ApplicationController
  skip_before_filter :authenticate
  skip_before_filter :choose_semester
  skip_before_filter :load_schedule

  def index # splash page
    redirect_to home_url if signed_in?
  end

  def show # default page for logged in users
    redirect_to courses_url
  end
end
