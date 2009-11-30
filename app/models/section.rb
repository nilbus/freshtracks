class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :semester
  has_many :wishlist_sections
  has_many :registered_sections
end
