Given /^I have logged in as an? "([^"]*)"$/ do |user_type|
  sign_in_as(user_type)
end

Given /^I have not logged in$/ do
  # nothing to do
end

When /^I log in as an? "([^"]*)"$/ do |user_type|
  sign_in_as(user_type)
end

def sign_in_as(user_type)
  visit '/sign_in'
  fill_in 'Email', :with => "#{user_type}@ncsu.edu"
  fill_in 'Password', :with => 'password'
  click_button 'Sign in'
end
