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

When /^I wishlist th[ie]se? class[es]{0,2}:$/ do |class_table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
  
end

Then /^my wishlist should( not)? have th[ie]se? class[es]{0,2}:$/ do |negative, class_table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

