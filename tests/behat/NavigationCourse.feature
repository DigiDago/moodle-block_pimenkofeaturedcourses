@javascript @block @block_pimenkofeaturedcourses-NavigationCourse
Feature: Pimenko Featured Courses block functionality

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email | idnumber |
      | teacher1 | Teacher | 1 | teacher1@example.com | T1 |
      | student1 | student | 1 | student1@example.com | E1 |
      | student2 | student | 2 | student2@example.com | E2 |

    And the following "categories" exist:
      | idnumber | name |
      | 0 | Category 1 |
      | 1 | Category 2 |

    And the following "courses" exist:
      | fullname | shortname | category | summary |
      | Course 1 | C1 | 0 | blabla |
      | Course 2 | C2 | 1  |  |

    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |
      | student1 | C1 | student |
      | student2 | C1 | student |
      | student1 | C2 | student |

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
    #And I set the following fields to these values:
     # | Order of Course 1 | 1 |
     # | Order of Course 2 | 2 |
   # And I wait until the page is ready
    And I press "Save changes"
    And I wait until the page is ready

  Scenario: Vérifie le lien vers le cours 1.


    When I am on site homepage
    And I click on ".card-deck .card:nth-child(1) .course_title a" "css_element"
    Then I should see "Course 1" in the ".pagelayout-course .page-header-headings h1" "css_element"

  Scenario: Vérifie le lien vers le cours 2.

    When I am on site homepage
    And I click on ".card-deck .card:nth-child(2) .course_title a" "css_element"
    Then I should see "Course 2" in the ".pagelayout-course .page-header-headings h1" "css_element"