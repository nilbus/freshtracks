class CoursesController < ApplicationController
  #autocomplete_for :searchkey

  # search courses; returns matching
  # Currently only uses one search term
  def index
    @courses = Course.where('semester_id = ? AND (courses.subject || courses.number || \' - \' || courses.name) ILIKE ?',
                            session[:semester],
                            '%' + params[:search] + '%')
    @courses = @courses.joins(:sections).includes(:sections).order("courses.subject || courses.number")
    @courses = @courses.group(Course.new.attributes.keys.map{|field| "courses.#{field}"}.join(", ") + ', courses.id')
    @courses = @courses.all

    # Load schedule so we don't display buttons for things already added
    @registered_section_ids = RegisteredSection.all.map &:section_id
    @wishlist_section_ids = WishlistSection.all.map &:section_id

  rescue TypeError # when params[:search].nil?
    # Don't search for courses if they haven't searched for them
    # The view should display instructions if @courses.nil?
    # and show that there were no results  if @courses.empty?
    @courses = nil
  end

end
