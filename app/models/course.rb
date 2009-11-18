class Course < ActiveRecord::Base
  def searchkey
    subject + number + ' - ' + name
  end
end
