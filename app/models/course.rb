class Course < ActiveRecord::Base
  has_many :sections

  def searchkey
    subject + number + ' - ' + name
  end
end
