class WishlistClassesController < ApplicationController
  # show wishlist
  def index
    @wishlist_classes = WishlistClass.all
    section_ids = @wishlist_classes.map{ |c| c.section_id}
    @wishlist_courses = Course.all(:joins => :sections, :conditions => ['sections.id in (?)', section_ids])   
  end

  # add a class to wishlist
  def create
    @wishlist_class = WishlistClass.new(params[:wishlist_class])
    @wishlist_class.section_id = params[:id]
    @wishlist_class.save
  end

  # change attributes of wishlisted class, like credit/audit
  def update
    @wishlist_class = WishlistClass.find(params[:id])
    @wishlist_class.update_attributes(params[:wishlist_class])
  end

  # remove from wishlist
  def destroy
    @wishlist_class.find(params[:id]).destroy
  end

end
