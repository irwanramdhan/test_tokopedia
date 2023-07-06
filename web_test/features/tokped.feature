Feature: Sort, buy & verify the order status

Scenario: Sort, buy & verify the product bought
  Given the user is on product page after logged in with 'standard_user'
  When the user sort and buy the product
  Then the user input form with 'user_data' and successfully verified the item