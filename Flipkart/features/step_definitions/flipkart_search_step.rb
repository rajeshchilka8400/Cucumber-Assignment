require_relative '../flipkart_po.rb'

Given("user is on the login page of application url under test") do
  @flipkart_session = Flipkart.new ("https://www.flipkart.com/")
end

When("user enters username and password to login") do
  @flipkart_session.login 
end

When /^user searches for the product "([^"]*)"$/ do |product|
  @flipkart_session.search_for_product product 
end

Then("user must successfully be able to see the searched results") do
  results = @flipkart_session.search_results
  expect(results).to be > 0
  @flipkart_session.quit_driver 
end