class SemestersController < ApplicationController
  # list upcoming semesters available for registration
  def index
    @semesters = Semesters.all
  end

end
