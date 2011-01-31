Given /^my wishlist has th[ie]se? class[es]{0,2}:$/ do |class_table|
  classes = class_table.hashes
  classes = classes.map do |c|
    course = Course.first(:conditions => {:subject => c['Subject'], :number => c['Number'], :name => c['Name']}) ||
             Course.create :subject => c['Subject'], :number => c['Number'], :name => c['Name'], :credits => 3

    days = c['Times'].split.first
    begin_time = c['Times'].split.last.split('-').first
    end_time = c['Times'].split.last.split('-').last
    pending
    section = Section.first(:conditions => {:professor => c['Instructor'], :days => days, :begin_time => begin_time, :end_time => end_time}) ||
              Section.create :professor => c['Instructor'], :days => days, :begin_time => begin_time, :end_time => end_time, :seats => 15,
                             :semester => nil
                                            
  end
end

When /^I wishlist th[ie]se? class[es]{0,2}:$/ do |class_table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^my wishlist should( not)? have th[ie]se? class[es]{0,2}:$/ do |negative, class_table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

