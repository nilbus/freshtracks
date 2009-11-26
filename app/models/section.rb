class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :semester
  has_many :wishlist_classes
  has_many :registered_classes
end
