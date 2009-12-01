class RegisteredSectionsController < ApplicationController
  # classes registered for current semester
  def index
    @registered_sections = RegisteredSections.all(:joins => :section,
                                                  :conditions => { 'sections.semester_id' => session[:semester] })
  end

  # register for a class
  def create
    @registered_section = RegisteredSection.new(params[:registered_section])
    @registered_section.save
  end

  # change attributes of registered class, like credit/audit
  def update
    @registered_section = RegisteredSection.find(params[:id])
    @registered_section.update_attributes(params[:registered_section])
  end

  # unregister
  def destroy
    @registred_class.find(params[:id]).destroy
  end

end
