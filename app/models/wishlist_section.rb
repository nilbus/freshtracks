class WishlistSection < ActiveRecord::Base
  belongs_to :semester
  belongs_to :section
end
