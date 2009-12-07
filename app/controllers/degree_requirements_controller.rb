class DegreeRequirementsController < ApplicationController
  # plan of work, with classes loaded
  def index
    @degree_requirements = DegreeRequirement.all(:include => :required)

    # Load schedule so we don't display buttons for things already added
    @registered_section_ids = RegisteredSection.all.map &:section_id
    @wishlist_section_ids = WishlistSection.all.map &:section_id
  end
end
