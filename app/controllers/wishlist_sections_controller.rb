class WishlistSectionsController < ApplicationController
  # show wishlist
  def index
    sections = WishlistSection.all
    section_ids = sections.map{ |c| c.section_id}
    @wishlist_sections = Section.all(:conditions => ['id in (?)', section_ids])   
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
    @wishlist_section.find(params[:id]).destroy
  end

end