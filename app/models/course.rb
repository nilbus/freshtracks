class Course < ActiveRecord::Base
  has_many :sections
  has_many :degree_requirements, :as => :required
  has_many :group_members

  before_save :generate_searchkey

  def generate_searchkey
    self.searchkey = "#{code} - #{name}"
  end

  def code
    "#{subject}#{number}"
  end

end
