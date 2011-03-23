class Section < ActiveRecord::Base
  include ApplicationHelper # for time_format

  belongs_to :course
  belongs_to :semester
  has_many :wishlist_sections
  has_many :registered_sections
  
  def timeslot
    begin_time.strftime(time_format) + "-" + end_time.strftime(time_format)
  end

  def code
    "#{number} #{professor.gsub(' ','').underscore}"
  end
  
  def meeting_times
    "#{days} #{begin_time.strftime(time_format)}-#{end_time.strftime(time_format)}"
  end
end
