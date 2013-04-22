Feature: Expense Creation
  In Order to submit an expense of an item
  A signed in user
  Should be able to submit and expense
  
  
  Scenario: Signed In User visits expenses page
    Given I signed in with valid credentials
     When I visit expenses page
     Then I should see "Add item list"
     
  Scenario: Signed In User Submits an expense
    Given I am on the expenses page
      And I fill in "Expense Item price" with '100.0'
      And I fill in "Expense Item name"  with 'Lunch'
      And I fill in "Expense Category"   with "Fruits"
    When I press 'Add'
    Then page should have notice message "Yay! Saved Successfully"
