require 'cucumber'

Given(/^I have three values$/) do |arg|
	values = "#{arg}"
end

When(/^user navigates to values page$/) do
	visit_values_page
end

Then(/^Three values should appear$/) do |values|
	verify_values_fields(#{values})
end	

#----------------------------------------------------------------
Given(/^negative, zero and positive numbers$/)  do |arg|
	values = "#{arg}"
end

When(/^user navigates to values page$/) do
	visit_values_page
end

Then(/^No zero or negative values should appear on the page$/) do |values|
	verify_values_page(#{values})
end


#------------------------------------------------------------
Given(/^negative, zero and positive values$/) do |arg1|
	values = "#{arg1}"		
end

When(/^user navigates to values page$/) do
	visit_values_page
end

Then(/^the Total Value texts field should equal "(.*?)"$/) do |arg2|
	verify_total("#{arg2}")
end


#----------------------------------------------------------------
Given(/^values of different amounts before and after the decimal place$/) do |arg|
	values = "{#arg1}"
end

When(/^User navigates to values page$/) do
	visit_values_page
end

Then(/^All values should appear as formatted currency$/) do |arg1,arg2|
	verify_values_fields("#{arg1}")	
	verify_total("#{arg2}")
end
