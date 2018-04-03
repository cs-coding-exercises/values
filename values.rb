require 'cucumber'
require 'value_page_object.rb'

@vp = ValuesPage. new

#----------------------------------------------------------------
Given(/^I have three values$/) do |arg|
	values = "#{arg}"
end

When(/^user navigates to values page$/) do
	@vp.visit_values_page
end

Then(/^Three values should appear$/) do |values|
	@vp.verify_values_fields(#{values})
end	

#----------------------------------------------------------------
Given(/^values including zero and negative$/)  do |arg|
	values = "#{arg}"
end

When(/^user navigates to values page$/) do
	@vp.visit_values_page
end

Then(/^No zero or negative values should appear on the page$/) do |values|
	@vp.verify_values_page(#{values})
end

#------------------------------------------------------------
Given(/^one or more positive values/) do |arg1|
	values = "#{arg1}"
	total_of_values = @vp.get_sum_of_values(values)
end

When(/^user navigates to values page$/) do
	@vp.visit_values_page
end

Then(/^the Total Value text field should equal the sum of the Values$/) do
	total_f = @vp.get_total_amount
	@vp.values_equal_total(total_of_values, total_f)
end


#----------------------------------------------------------------
Given(/^values of different significant digits$/) do |arg|
	values = "{#arg1}"
	total_of_values = @vp.get_sum_of_values(values)
end

When(/^User navigates to values page$/) do
	@vp.visit_values_page
end

Then(/^All values should appear as formatted currency$/) do
	@vp.verify_values_fields("#{arg1}")
	@vp.verify_total_fields(total_of_values)
end
