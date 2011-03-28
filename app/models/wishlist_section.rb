class WishlistSection < ActiveRecord::Base
  belongs_to :section
  belongs_to :user

  validates_uniqueness_of :section_id, :scope => [:user_id], :message => 'is already on your wishlist.'
end
