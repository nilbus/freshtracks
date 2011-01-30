Given /^I have logged in as an? "([^"]*)"$/ do |user_type|
  pending unless user_type == 'student'
end

Given /^I have not logged in$/ do
  # no action necessary
end

When /^I log in as an? "([^"]*)"$/ do |user_type|
  pending unless user_type == 'student'
end

