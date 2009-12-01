class Group < ActiveRecord::Base
  has_many :degree_requirements, :as => :required
  has_many :group_members
end
