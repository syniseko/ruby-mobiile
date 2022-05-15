@momo
Feature: Testing for Momotrip Web
	Scenario: TC-01 Create New Registration user
		Given Open Browser App
		And User login with data account "source_account"
		And User click "login/login_page/login_button"

		And User click "products/products_page/filter_hilo_dropdown"
		# Then User wait 15 seconds
		And Verify data price products sort by highest to low



