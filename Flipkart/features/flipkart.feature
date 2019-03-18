Feature: Search for product in Flipkart

Scenario Outline: Go to flipkart and validate search results for the product

Given user is on the login page of application url under test
When user enters username and password to login
And user searches for the product "<product>"
Then user must successfully be able to see the searched results

Examples:
|product|
|iphoneX|
|dasdsadsadasdasd|