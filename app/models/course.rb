class Course < ActiveRecord::Base
  has_many :sections
  has_many :degree_requirements, :as => :required
  has_many :group_members

  def searchkey
    subject + number + ' - ' + name
  end
end
