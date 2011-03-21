class RegisteredSection < ActiveRecord::Base
  belongs_to :section
  belongs_to :user

  validates_uniqueness_of :section_id, :message => 'That is already on your schedule.'
  
  #These two custom validations are not very DRY. Optimize?
  validate :not_already_registered_for_course
  validate :not_a_schedule_conflict

  validate :check_and_remove_from_wishlist
  
protected
  def check_and_remove_from_wishlist
    wishlist_section = WishlistSection.where(:user_id => user_id).find_by_section_id(section_id)
    if(wishlist_section != nil)
      wishlist_section.delete()
    end
  end

  def not_already_registered_for_course
    new_course_code = Section.find(section_id).course.code
    
    RegisteredSection.where(:user_id => user_id).each do |registered_section|
      if (registered_section.section.course.code == new_course_code)
	errors.add(:base, "Unable to register for section: you are already registered for another section of this course.")
      end
    end
  end
  
  def not_a_schedule_conflict
    new_section = Section.find(section_id)
    
    RegisteredSection.where(:user_id => user_id).each do |registered_section|
      if(time_conflict?(new_section, registered_section.section))
	errors.add(:base, "Unable to schedule class: you are already scheduled for another class at that time.")
      end
    end
  end
  
  def time_conflict?(section1, section2)
    days1 = section1.days
    days2 = section2.days
    
    #If they don't share any days of the week, there's no conflict
    if((days1.split("") & days2.split("")) == [])
      return false
    end
    
    begin_time1 = section1.begin_time
    end_time1 = section1.end_time
    
    begin_time2 = section2.begin_time
    end_time2 = section2.end_time
    
    #If the start or end time of the second section is during the first section, error!
    if(    ((begin_time1 < begin_time2) and (begin_time2 < end_time1)) \
        or ((begin_time1 < end_time2) 	and (end_time2 < end_time1))   \
	or ((begin_time2 < begin_time1) and (begin_time1 < end_time2)) \
	or ((begin_time2 < end_time1) 	and (end_time1 < end_time2)) ) 
      return true
    end
    return false
  end
end
