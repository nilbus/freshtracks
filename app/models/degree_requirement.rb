class DegreeRequirement < ActiveRecord::Base
  belongs_to :group
  belongs_to :course
end
