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
    And I am on "Course 1" course homepage with editing mode on
    And I add the "Flexible featured course" block
@javascript
@block @block_pimenkofeaturedcourses-AddCourses


Scenario: Add courses to the pimenko featured course bloc

  When I configure the "Flexible featured course" block
  And I open the autocomplete suggestions list
  And I click on "Course 1" item in the autocomplete list
  And I open the autocomplete suggestions list
  And I click on "Course 2" item in the autocomplete list
  And I open the autocomplete suggestions list
  And I click on "Course 3" item in the autocomplete list
  And I press "Save changes"
  Then I should see "Course 1" in the "block_pimenkofeaturedcourses" "block"
  And I should see "Course 2" in the "block_pimenkofeaturedcourses" "block"
  And I should see "Course 3" in the "block_pimenkofeaturedcourses" "block"