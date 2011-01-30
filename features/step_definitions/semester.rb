def semester_selector(semester)
  "img[@alt='#{semester}_semester']"
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
  page.should have_css(semester_selector('This'))
  page.should have_css(semester_selector('Next'))
end

def select_semester(semester)
  visit '/semesters'
  semester = semester.camelcase
  semester.gsub! 'Current', 'This'
  find(semester_selector(semester)).click
end

