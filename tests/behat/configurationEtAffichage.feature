@block @block_pimenkofeaturedcourses-configurationEtAffichage
Feature: Pimenko Featured Courses block functionality
 Background:
   Given the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1 | 0 |
      | Course 2 | C2 | 0 |
      | Course 3 | C3 | 0 |
   And I log in as "admin"
   And I am on site homepage

@javascript
 Scenario: Adding the Pimenko Featured Courses block to the site homepage
    Given I turn editing mode on
    When I add the "Flexible featured course" block
    Then I should see the "pimenkofeaturedcourses" "block"
