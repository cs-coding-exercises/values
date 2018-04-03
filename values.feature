Feature:  Value page

Background:
Given I am in the Chrome browser:

#----------------------------------------------------------------
Scenario: The proper number of values should appear on the screen
Given there are values:
	|value		|
	|123		|
	|123.45		|
	|1000.00	|
When user navigates to values page
Then label "Value 3" should be present
And label "Value 4" should not be present
And <lbl_val> with text <label_text> should appear beside <txt_val> with text <value>

Examples:
	|lbl_val	|label_text	|txt_val	|value
	|lbl_val_1	|Value 1	|txt_val_1	|$123.00	
	|lbl_val_2	|Value 2	|txt_val_2	|$123.45	
	|lbl_val_3	|Value 3	|txt_val_3	|$1,000.00
	

#----------------------------------------------------------------
Scenario: only values greater than zero should appear on the screen
Given there are values:
	|value		|
	|-222		|
	|333.33		|
	|-.01		|
	|4444.4		|
	|0		|
	|0.0		|
	|0.00		|
When user navigates to values page
Then None of the  zero or negative values should appear on the page
And <lbl_val> with text <label_text> should appear beside <txt_val> with text <value>
Examples:
	|lbl_val	|label_text	|txt_val	|value		|
	|lbl_val_1	|Value 1	|txt_val_1	|$333.33	|
	|lbl_val_2	|Value 2	|txt_val_2	|$4,444.40	|


#----------------------------------------------------------------
Scenario: The Total Balance should equal the sum of the values listed
Given there are values:
	|value		|
	|111.11		|
	|222		|
	|333.33		|
	|-.01		|
	|4444.4		|
	|0		|
	|5555.50

Then the Total Value text field should equal "$10,666.34"


#----------------------------------------------------------------
Scenario: All Values should formatted as currency ($D,DDD,DDD.cc)
Given there are values:
	|value		|
	|1		|
	|1.1		|
	|1.01		|
	|1.10		|
	|100		|
	|1000		|
	|100000		|
	|1000000	|
When user navigates to values page
Then <lbl_val> with text <label_text> should appear beside <txt_val> with text <value>
And the total value should be "$1,101,104.21"

Examples:
	|lbl_val	|label_text	|txt_val	|value		|
	|lbl_val_1	|Value 1	|txt_val_1	|$1.00		|
	|lbl_val_2	|Value 2	|txt_val_2	|$1.10		|
	|lbl_val_3	|Value 3	|txt_val_3	|$1.01		|
	|lbl_val_4	|Value 4	|txt_val_4	|$1.10		|
	|lbl_val_5	|Value 5	|txt_val_5	|$100.00	|
	|lbl_val_6	|Value 6	|txt_val_6	|$1,000.00	|
	|lbl_val_7	|Value 7	|txt_val_7	|$100,000	|
	|lbl_val_8	|Value 8	|txt_val_8	|$1,000,000	|
