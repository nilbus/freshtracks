class CoursesController < ApplicationController
  #autocomplete_for :searchkey

  # search courses; returns matching
  # Currently only uses one search term
  def index
    begin
                                           # sqlite query
      @courses = Course.all(:conditions => ['semester_id = ? AND (courses.subject || courses.number || \' - \' || courses.name) ILIKE ?',
                                            session[:semester],
                                            '%' + params[:search] + '%'],
                            :joins => :sections,
                            :include => :sections,
                            # Postgres requires you to explicitly list all fields to group. Whyyy? This is fixed by Rails 3 with :unique => true
                            :group => Course.new.attributes.keys.map{|field| "courses.#{field}"}.join(", ") + ', courses.id',
                            :order => "courses.subject || courses.number")

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

end
