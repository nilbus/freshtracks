class WishlistClassesController < ApplicationController
  # show wishlist
  def index
    @wishlist_classes = WishlistClass.all
  end

  # add a class to wishlist
  def create
    @wishlist_class = WishlistClass.new(params[:wishlist_class])
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
