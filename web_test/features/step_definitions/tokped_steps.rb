Given('the user is on product page after logged in with {string}') do |login_credential|
  page.visit('/') # to access the login page
  @standard_user = TokpedRequirement.new.load_tokped(login_credential)
  @pages.tokped_page.username.set @standard_user['standard_username']
  @pages.tokped_page.password.set @standard_user['standard_password']
  @pages.tokped_page.btn_login.click
  expect(@pages.tokped_page.title).to have_text 'Products' # to verfif the user is successfully logged in
end

When('the user sort and buy the product') do
  @pages.tokped_page.dropdown_sort[3].click # to sort from high to low
  expect(@pages.tokped_page.item_name[0]).to have_text 'Sauce Labs Fleece Jacket' # to verify the item sorted correctly
  expect(@pages.tokped_page.item_price[0]).to have_text '$49.99'
  @pages.tokped_page.item_name[0].click
  expect(@pages.tokped_page.item_name_detail).to have_text 'Sauce Labs Fleece Jacket' # to verify the system display the correct item detail
  expect(@pages.tokped_page.item_price_detail).to have_text '$49.99'
  @pages.tokped_page.btn_add_to_cart.click
  expect(@pages.tokped_page.btn_remove_cart).to have_text 'Remove'
  @pages.tokped_page.btn_open_cart.click
  @pages.tokped_page.btn_checkout.click
end

Then('the user input form with {string} and successfully verified the item') do |input_user_form|
  @user_data = TokpedRequirement.new.load_tokped(input_user_form) # fill user data
  @pages.tokped_page.first_name.set @user_data['firstname']
  @pages.tokped_page.last_name.set @user_data['lastname']
  @pages.tokped_page.zip_code.set @user_data['zipcode']
  @pages.tokped_page.btn_continue.click
  expect(@pages.tokped_page.payment_shipping_info[0]).to have_text 'SauceCard #31337' # to verify payment info
  expect(@pages.tokped_page.payment_shipping_info[1]).to have_text 'Free Pony Express Delivery!' # to verify shipping info
  expect(@pages.tokped_page.subtotal).to have_text 'Item total: $49.99' # to verify subtotal
  expect(@pages.tokped_page.tax).to have_text 'Tax: $4.00' # to verify tax
  expect(@pages.tokped_page.total).to have_text 'Total: $53.99' # to verify total
  @pages.tokped_page.btn_finish.click
  expect(@pages.tokped_page.header_order).to have_text 'Thank you for your order!'
  expect(@pages.tokped_page.text_order).to have_text 'Your order has been dispatched, and will arrive just as fast as the pony can get there!'
  @pages.tokped_page.btn_back_to_home.click
  expect(@pages.tokped_page.title).to have_text 'Products'
end