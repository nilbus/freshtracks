class CoursesController < ApplicationController
  #autocomplete_for :searchkey

  # search courses; returns matching
  # Currently only uses one search term
  def index
    @courses = Course.all(:conditions => ['(subject || number || " - " || name) LIKE ?', '%' + params[:search] + '%'])
  end

end
