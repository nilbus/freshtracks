When /^I search for "([^"]*)"$/ do |query|
  fill_in('search', :with => query)
  click_button('Search')
end

When /^I expand the course "([^"]*)"$/ do |course|
  expand_course course
end

Then /^the course "([^"]*)" should not have an? "([^"]*)" (button|link)$/ do |course, clickable|
  pending # express the regexp above with the code you wish you had
end

