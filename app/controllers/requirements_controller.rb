class RequirementsController < ApplicationController
  def index
    @requirements = Requirement.all
  end
end
