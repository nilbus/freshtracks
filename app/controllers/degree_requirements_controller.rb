class DegreeRequirementsController < ApplicationController
  # plan of work, with classes loaded
  def index
    @degree_requirements = DegreeRequirements.all(:include => :classes)
  end

end
