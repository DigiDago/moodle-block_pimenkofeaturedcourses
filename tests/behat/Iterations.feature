@javascript @block @block_pimenkofeaturedcourses-Iterations
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
    And I click on ".primary-navigation li[data-key='myhome'] a" "css_element"
    And I wait until the page is ready
    And I turn editing mode on
    And I add the "Flexible featured course" block
    And I configure the "Flexible featured course" block
    And I wait until the page is ready
    And I click on ".form-autocomplete-downarrow" "css_element"
    And I click on "Course 1" item in the autocomplete list
    And I wait until the page is ready
    And I press "Save changes"
    And I wait until the page is ready
    And I add the "Flexible featured course" block
    And I wait until the page is ready
    And I click on "#block-region-side-pre section:nth-of-type(2) .fa-cog" "css_element"
    And I click on "#block-region-side-pre section:nth-of-type(2) .dropdown-menu-right .editing_edit" "css_element"
    And I wait until the page is ready
    And I click on ".form-autocomplete-downarrow" "css_element"
    And I click on "Course 2" item in the autocomplete list
    And I wait until the page is ready
    And I press "Save changes"
    And I wait until the page is ready


  Scenario: Vérifie que deux blocs "Flexible featured course" différents peuvent se trouver sur une même page

    When I click on ".primary-navigation li[data-key='myhome'] a" "css_element"
    Then I should see "Flexible featured course" in the "#block-region-side-pre section:first-of-type .card-title" "css_element"
    And I should see "Flexible featured course" in the "#block-region-side-pre section:nth-of-type(2) .card-title" "css_element"
