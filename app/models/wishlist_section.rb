class WishlistSection < ActiveRecord::Base
  belongs_to :section

  validates_uniqueness_of :section_id, :message => 'is already on your wishlist.'
end
