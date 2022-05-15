@testscript_TokopediaTest
Feature: Sample Saucedemo - e2e Buy Product

	@web @e2e_buy_product
	Scenario: TC-01 Success Buy Product High Price
		Given Open Browser App
		And User login with data account "standard_account"
		And User click "login/login_page/login_button"
		And User click "products/products_page/filter_hilo_dropdown"

		# Verify sorting data on page product
		Then Verify data price products sort by highest to low

		And User click "products/products_page/title_high_price_label"
		Then User verify element "products/product_detail_page/title_product_label" with data translation "product_title_label"
		Then User verify element "products/product_detail_page/price_product_label" with data translation "product_price_label"

		And User click "products/product_detail_page/add_to_cart_button"
		And User click "products/product_detail_page/cart_icon_button"
		And User click "checkout/your_cart_page/checkout_button"

		When User fill element "checkout/checkout_info_page/first_name_field" with data translation "first_name_data"
		When User fill element "checkout/checkout_info_page/last_name_field" with data translation "last_name_data"
		When User fill element "checkout/checkout_info_page/postal_code_field" with data translation "zip_data"

		And User click "checkout/checkout_info_page/countinue_button"
		
		#Verify Page Checkout
		Then User verify element "checkout/overview_page/checkout_title" with data translation "checkout_title_label" 
		Then User verify element "checkout/overview_page/quantity_label" with data translation "quantity_data" 
		Then User verify element "checkout/overview_page/inventroy_name_label" with data translation "product_title_label" 
		Then User verify element "checkout/overview_page/inventory_desc_label" with data translation "checkout_product_desc_text" 
		Then User verify element "checkout/overview_page/price_value_label" with data translation "product_price_label"
		Then User verify element "checkout/overview_page/payment_info_label" with data translation "payment_info_text" 
		Then User verify element "checkout/overview_page/payment_value_label" with data translation "payment_value_text" 
		Then User verify element "checkout/overview_page/shipping_info_label" with data translation "shipping_info_text" 
		Then User verify element "checkout/overview_page/shipping_value_label" with data translation "shipping_value_text"
		Then User verify element "checkout/overview_page/summary_subtotal_label" with data translation "sub_total_text" 
		Then User verify element "checkout/overview_page/summary_subtax_label" with data translation "tax_text" 
		Then User verify element "checkout/overview_page/summary_total_label" with data translation "final_total_text" 

		And User click "checkout/overview_page/finish_button"

		# Verify Page Finish + Screenshoot
		Then User verify element "checkout/overview_page/finish_title" with data translation "finish_title_text" 
		Then User verify element "checkout/overview_page/finish_header_text" with data translation "finish_header_text" 
		Then User verify element "checkout/overview_page/finish_body_text" with data translation "finish_body_text" 
		Then User verify element "checkout/overview_page/finish_image" attribute "src" with data translation "finish_image_url"
		Then System screenshoot page
		Then User wait 5 seconds


