class RegisteredSectionsController < ApplicationController
  # classes registered for current semester
  def index
    # @registered_sections is loaded in application_controller#load_schedule,
    # since it's used on nearly every page.
  end

  # register for a class
  def create
    @registered_section = RegisteredSection.create(params[:registered_section])
    respond_to do |format|
      format.html { redirect_to registered_sections_path }
      format.js { render :partial => 'created', :object => @registered_section }
    end
  end

  # change attributes of registered class, like credit/audit
  def update
    @registered_section = RegisteredSection.find(params[:id])
    @registered_section.update_attributes(params[:registered_section])
  end

  # unregister
  def destroy
    RegisteredSection.find(:first, :conditions => ["section_id = ?", params[:id]]).destroy
  end

end
