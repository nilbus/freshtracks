When /^I click on "([^"]*)" for this class:$/ do |clickable, class_table|
  this_class = class_table.hashes.first
  subject = this_class['Subject']
  number = this_class['Number']
  instructor_name = this_class['Instructor'].gsub(' ','').underscore
  within(:css, "tbody.#{subject}#{number}.#{instructor_name}") do
    click_link_or_button clickable
  end
end

Then /^there should be a highlight on th[ie]se? class[es]{0,2}:$/ do |class_table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^this class should not have an "([^"]*)" (link|button):$/ do |clickable, type, class_table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

