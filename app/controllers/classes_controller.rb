class ClassesController < ApplicationController
  autocomplete_for :searchkey

  # search classes; returns matching
  # Currently only uses one search term
  def index
    @classes = Class.all(:conditions => ['CONCAT(CONCAT(CONCAT(subject, number), " - "), name) LIKE "%?%"'], params[:search])
  end

end
