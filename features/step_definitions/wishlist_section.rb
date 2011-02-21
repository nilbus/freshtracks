Given /^my wishlist has th[ie]se? class[es]{0,2}:$/ do |class_table|
  classes = class_table.hashes
  WishlistSection.all.each do |wishlist_section|
    # Prune the fixtures down to the ones that were requested
    section = wishlist_section.section
    wishlist_section.destroy unless classes.detect do |c|
      section.course.subject == c['Subject'] &&
      section.course.number == c['Number'] &&
      section.professor == c['Instructor']
    end
  end
  if WishlistSection.count != classes.size
    pp classes
    pp WishlistSection.all.map{|w|"#{w.section.course.searchkey} by #{w.section.professor} in #{w.section.semester.name}"}
    raise "Fixtures are missing for these WishlistSection fixtures: " +
          classes.map{|c|"#{c['Subject']}#{c['Number']} with #{c['Instructor']}"}.to_sentence
  end
end

Given /^my wishlist is empty$/ do
  WishlistSection.where(:user_id => @current_user.id).each &:destroy
end

When /^I wishlist th[ie]se? class[es]{0,2}:$/ do |class_table|
  return pending
  classes = class_table.hashes
  classes.each do |c|
    subject = c['Subject']
    number = c['Number']
    instructor = c['Instructor'].gsub(' ', '').underscore

    #save_and_open_page
    expand_course "#{subject}#{number}"
    within ".#{subject}#{number} .#{instructor}" do
      click_link_or_button 'Add to Wishlist'
    end
  end
end

Then /^my wishlist should( not)? have th[ie]se? class[es]{0,2}:$/ do |negative, class_table|
  classes = class_table.hashes
  wishlisted = WishlistSection.where(:user_id => @current_user.id, :semester_id => @current_semester.id)
end

