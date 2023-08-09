@javascript @block @block_pimenkofeaturedcourses-OrderCourses
Feature: Pimenko Featured Courses block functionality

Background:
   Given the following "users" exist:
      | username | firstname | lastname | email | idnumber |
      | teacher1 | Teacher | 1 | teacher1@example.com | T1 |

   And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1 | 0 |
      | Course 2 | C2 | 0 |
      | Course 3 | C3 | 0 |

   And I log in as "admin"
   And I am on site homepage
   And I turn editing mode on
   And I add the "Flexible featured course" block
   And I configure the "Flexible featured course" block
   And I wait until the page is ready
   And I click on ".form-autocomplete-downarrow" "css_element"
   And I click on "Course 1" item in the autocomplete list
   And I wait until the page is ready
   And I click on ".form-autocomplete-downarrow" "css_element"
   And I click on "Course 2" item in the autocomplete list
   And I wait until the page is ready
   And I press "Save changes"
   And I wait until the page is ready



Scenario: Modifie emplacement affichage des cours vedettes

     When I configure the "Flexible featured course" block
     And I set the following fields to these values:
         | Order of Course 2 | 1 |
         | Order of Course 1 | 2 |
     And I press "Save changes"
     Then I should see "Course 2" in the ".card-deck .card:nth-child(1) .course_title" "css_element"
     And I should see "Course 1" in the ".card-deck .card:nth-child(2) .course_title" "css_element"