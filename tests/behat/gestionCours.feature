@javascript @block @block_pimenkofeaturedcourses-gestionCours
Feature: Pimenko Featured Courses block functionality
 Background:
   Given the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1 | 0 |
      | Course 2 | C2 | 0 |
      | Course 3 | C3 | 0 |
   And I log in as "admin"
   And I am on site homepage
   And I turn editing mode on
   And I add the "Flexible featured course" block

 Scenario: Adding courses to the Pimenko Featured Courses block to the site homepage
    When I configure the "Flexible featured course" block
    And I wait until the page is ready
    And I click on ".form-autocomplete-downarrow" "css_element"
    And I click on "Course 1" item in the autocomplete list
    And I wait until the page is ready
    And I click on ".form-autocomplete-downarrow" "css_element"
    And I click on "Course 2" item in the autocomplete list
    And I wait until the page is ready
    And I press "Save changes"
    And I wait until the page is ready
    Then I should see "Course 1" in the "block_pimenkofeaturedcourses" "block"
    And I should see "Course 2" in the "block_pimenkofeaturedcourses" "block"
    
