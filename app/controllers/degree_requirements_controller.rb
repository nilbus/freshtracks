class DegreeRequirementsController < ApplicationController
  # plan of work, with classes loaded
  def index
    @degree_requirements = DegreeRequirement.all(:include => :required)
  end
end
