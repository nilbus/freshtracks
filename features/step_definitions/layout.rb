def navigation_container
  '.tab-list'
end

def caption_container
  '.caption'
end

When /^I navigate to the "([^"]*)" page$/ do |page|
  within(navigation_container) do
    click_link page
  end
end

When /^I click on( the (link|button))? "([^"]*)"$/ do |ignore, type, clickable|
  click_link_or_button clickable
end

Then /^I should see a caption that contains "([^"]*)"$/ do |text|
  within caption_container do
    page.should have_content(text)
  end
end

Then /^the layout should indicate that I am working with the "([^"]*)" semester$/ do |semester|
  pending
  semester_name = "Fall 2011 (fixme)"
  page.should have_content("Semester: ", semester_name)
end

