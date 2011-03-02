class DegreeRequirementsController < ApplicationController
  # plan of work, with classes loaded
  def index
    @degree_requirements = DegreeRequirement.all(:include => :required)

    # Load schedule so we don't display buttons for things already added
    @registered_section_ids = RegisteredSection.all.map &:section_id
    @wishlist_section_ids = WishlistSection.all.map &:section_id
   
    #Get all the degree requirements and completed courses (for the current user)
    reqs = DegreeRequirement.all
    complete = CompletedCourse.where(:user_id => current_user.id).all

    #Boil complete down in to a list of ids
    complete_map = complete.map{ |x| x.degree_requirement_id }

    #Remove all the requirements that are satisfied
    reqs.delete_if{ |r| (complete_map.include? r.id) }

    @complete_requirements = complete
    @incomplete_requirements = reqs 

 end
end
