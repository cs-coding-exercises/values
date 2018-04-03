require 'selenium-webdriver'

class ValuesPage

	TOTAL_VALUE_LABEL	= { id: 'lbl_ttl_val'}
	TOTAL_VALUE_TEXT	= { id: 'txt_ttl_val'}

	total_label_text = "Total Balance"

	attr_reader :driver

	#----------------------------
	def initialize(driver)
    		@driver = driver = Selenium::WebDriver.for :chrome
	end

	#----------------------------
	def visit_values_page()
    		@driver.get('https://www.exercise1.com/values')
	end

	#----------------------------
	def format_to_currency(amount)
	
		amount_s = amount.to_s

		#splits amt into dollars and cents
		dollars_cents  = amount_s.split('.')
		dollars = dollars_cents[0]
		cents = dollars_cents[1]

		#puts comments into dollars
		dollars_with_commas = dollars.to_s.reverse.gsub(/(\d{3})/,"\\1,").chomp(",").reverse

		#creates new string with "$", dollars, "." and cents
		amount_s = "$#{dollars_with_commas}.#{cents}"
		return amount_s
	end

	#--------------------------------
	def verify_values_fields(values)
		values.each_with_index	|val, index|
			if val > 0
				label = @driver.find_element(:id, "lbl_val_#{(index + 1).to_s}").get_text
				value = @driver.find_element(:id, "txt_val_#{(index + 1).to_s}").get_text
	
				label.should == "Value #{(index + 1).to_s}"
				value.should == format_to_currency(val)
			end
	end				

	#---------------------------------
	def get_sum_of_values(values)
		values_sum = 0
		for values.each |value|
			values_sum += value
			values_sum_s = format_to_currency(values_sum)			
			return values_sum
	end

	#--------------------------------
	def get_total_amount()
		total_s = @driver.find_element(TOTAL_VALUE_TEXT).text
		total_f = total_s.to_f
		return total_f
	end

	#--------------------------------
	def convert_curr_to_float(amount)	
		amount.gsub(/[^\d\.]/, '').to_f	
	end

	#--------------------------------
	def verify_values_equal_total(sum_of_values, total)	
		sum_of_values.should == total
	end

	#--------------------------------
	def verify_total_fields(total)
		@driver.find_element(TOTAL_VALUE_LABEL).text.should == @total_label_text
		@driver.find_element(TOTAL_VALUE_TEXT).text.should == format_to_currency(total)
	end

end
