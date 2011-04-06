class CoursesController < ApplicationController
  autocomplete :course, :searchkey, :full => true

  # search courses; returns matching
  # Currently only uses one search term
  def index
    search_terms = params[:search].split(' ') rescue []

    # Build the query
    c = Course
    c = c.joins(:sections).includes(:sections).order("courses.subject || courses.number")
    c = c.where(:sections => {:semester_id => session[:semester]})
    c = c.group(Course.new.attributes.keys.map{|field| "courses.#{field}"}.join(", ") + ', courses.id')
    search_terms.each do |term|
      c = c.where('courses.searchkey ILIKE ?', "%#{term}%")
    end
    @courses = c.all

    # Get a list of all the classes the current user has wishlisted & scheduled 
    @registered_section_ids = 
      RegisteredSection.where(:user_id => current_user.id).map &:section_id
    @wishlist_section_ids = 
      WishlistSection.where(:user_id => current_user.id).map &:section_id

  rescue TypeError # when params[:search].nil?
    # Don't search for courses if they haven't searched for them
    # The view should display instructions if @courses.nil?
    # and show that there were no results  if @courses.empty?
    @courses = nil
  end

end
