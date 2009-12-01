class RegisteredSection < ActiveRecord::Base
  belongs_to :semester
  belongs_to :section
end
