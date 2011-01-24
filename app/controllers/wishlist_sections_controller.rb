class WishlistSectionsController < ApplicationController
  # show wishlist
  def index
    @wishlist_sections = WishlistSection.all(:joins => :section,
                                             :conditions => { 'sections.semester_id' => session[:semester] })
  end

  #We can probably refactor this respond_to format
  # http://ryandaigle.com/articles/2009/8/6/what-s-new-in-edge-rails-cleaner-restful-controllers-w-respond_with

  # add a class to wishlist
  def create
    @wishlist_section = WishlistSection.create(params[:wishlist_section])
    respond_to do |format|
      format.html { redirect_to wishlist_sections_path }
      format.js { render :partial => 'created', :object => @wishlist_section }
    end
  end
  
  # register for all of the classes
  def register_all
    @wishlist_sections = WishlistSection.all(:joins => :section,
                                             :conditions => { 'sections.semester_id' => session[:semester] })
                                             
    flash[:wishlist_section] = {}
    @wishlist_sections.each do |wishlist_section|
      new_section = RegisteredSection.create({"section_id" => wishlist_section.section_id})

      if(new_section.errors == nil)
				wishlist_section.destroy()
      else
				if (new_section.errors.on_base != nil)
					flash[:wishlist_section][wishlist_section.id] = new_section.errors.on_base
				end
      end
    end
    
    redirect_to :action => :index
  end

  # change attributes of wishlisted class, like credit/audit
  def update
    @wishlist_section = WishlistSection.find(params[:id])
    @wishlist_section.update_attributes(params[:wishlist_section])
  end

  # remove from wishlist
  def destroy
    WishlistSection.find(params[:id]).destroy
    respond_to do |format|
      format.html {
        flash[:notice] = "Class successfully removed from wishlist."
        redirect_to wishlist_sections_path
      }
      format.js { render :text => ''}
    end
  end

end
