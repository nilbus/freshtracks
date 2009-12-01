class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :semester
  has_many :wishlist_sections
  has_many :registered_sections
  
  def timeslot
    time_format = '%I:%M%p'
    begin_time.strftime(time_format) + "-" + end_time.strftime(time_format)
  end
end
