class CoursesController < ApplicationController
  autocomplete_for :searchkey

  # search courses; returns matching
  # Currently only uses one search term
  def index
    @classes = Course.all(:conditions => ['CONCAT(CONCAT(CONCAT(subject, number), " - "), name) LIKE "%?%"'], params[:search])
  end

end
