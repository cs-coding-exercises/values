Feature:  Value page

Background:
Given /^I am in the Chrome browser$/

#----------------------------------------------------------------
Given(/^I have three values$/) do
	values = [123, 123.45, 1000.00]
end

When(/^user navigates to values page$/) do
	visit_values_page
end

Then(/^Three values should appear$/) do
	verify_values_fields(values)
end	

#----------------------------------------------------------------
Scenario: only values greater than zero should appear on the screen

Given(/^negative, zero and positive numbers$/)  do
	values = [-222,333.33,-.01,4444.4, 0, 0.0, 0.00]
end

When(/^user navigates to values page$/) do
	visit_values_page
end

Then(/^No zero or negative values should appear on the page$/) do
	verify_values_page(values)
end


#------------------------------------------------------------
Scenario: The Total Balance should equal the sum of the values listed
Given(/^negative, zero and positive values$/) do
	values = [111.11, 222, 333.33, -0.01, 4444.4, 0, 5555.5]		
end

When(/^user navigates to values page$/) do
	visit_values_page
end

Then(/^the Total Value texts field should equal "(.*?)"$/) do
	verify_total(exp_total)
end


#----------------------------------------------------------------
#all values should be formatted as currency
Given(/^values of different amounts before and after the decimal place$/) do
	values = [1, 1.10, 1.01, 1.10, 100, 1000, 100000, 1000000]		
end

When(/^User navigates to values page$/) do
	visit_values_page
end

Then(/^All values should appear as formatted currency$/) do
	verify_values_fields(values)	
end
