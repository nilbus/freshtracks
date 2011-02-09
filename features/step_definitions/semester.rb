def semester_selector_link_id(semester)
  semester = semester.downcase.gsub 'current', 'this'
  "#{semester}_semester"
end

Given /^I am working with the "([^"]*)" semester$/ do |semester|
  select_semester semester
end

Given /^the "([^"]*)" semester's add deadline has passed$/ do |semester|
  pending # express the regexp above with the code you wish you had
end

When /^I select the "([^"]*)" semester$/ do |semester|
  select_semester semester
end

Then /^I should have to select which semester I want to work with$/ do
  page.should have_css("##{semester_selector_link_id('This')}")
  page.should have_css("##{semester_selector_link_id('Next')}")
end

# semester is usually 'current' or 'next'
def select_semester(semester)
  visit '/semesters'
  click_link semester_selector_link_id(semester)
end

