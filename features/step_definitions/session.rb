Given /^I have logged in as an? "([^"]*)"$/ do |user_type|
  pending unless user_type == 'student'
  visit '/'
end

Given /^I have not logged in$/ do
  # no action necessary
  visit '/'
end

When /^I log in as an? "([^"]*)"$/ do |user_type|
  pending unless user_type == 'student'
  visit '/'
end

