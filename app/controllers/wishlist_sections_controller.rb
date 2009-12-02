class WishlistSectionsController < ApplicationController
  # show wishlist
  def index
    @wishlist_sections = WishlistSection.all(:joins => :section,
                                             :conditions => { 'sections.semester_id' => session[:semester] })
  end

  # add a class to wishlist
  def create
    @wishlist_section = WishlistSection.new(params[:wishlist_section])
    @wishlist_section.section_id = params[:id]
    @wishlist_section.save
  end

  # change attributes of wishlisted class, like credit/audit
  def update
    @wishlist_section = WishlistSection.find(params[:id])
    @wishlist_section.update_attributes(params[:wishlist_section])
  end

  # remove from wishlist
  def destroy
    WishlistSection.find(params[:id]).destroy
    flash[:notice] = "Class successfully removed from wishlist."
    redirect_to wishlist_sections_path
  end

end
