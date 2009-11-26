class Semester < ActiveRecord::Base
  has_many :courses, :through => :sections
  has_many :sections
end
