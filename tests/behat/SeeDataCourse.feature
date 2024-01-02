@javascript @block @block_pimenkofeaturedcourses-SeeDataCourse
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
   And I set the following fields to these values:
      | Order of Course 1 | 1 |
      | Order of Course 2 | 2 |
   And I wait until the page is ready
   And I press "Save changes"
   And I wait until the page is ready

 Scenario: Vérifie l'affichage et le non affichage de la description du cours, en fonction de son existence.
     When I click on ".card-deck .card:nth-child(1) .fa-info" "css_element"
     Then I should see a modal window with "blabla"
     And the ".card-deck .card:nth-child(2) .fa-info" css element should not exist

 Scenario: Vérifie l'affichage de la catégorie du cours.
     When I am on site homepage
     Then I should see "Category 1" in the ".card-deck .card:nth-child(1) .categoryname" "css_element"
     And I should see "Category 2" in the ".card-deck .card:nth-child(2) .categoryname" "css_element"

 Scenario: Vérifie l'affichage du nombre d'étudiant inscrits.
   When I reload the page
   And I wait until the page is ready
   Then the ".card-deck .card:nth-child(2) div.course-enrolments" css element should contain "1 subscribers"
   And the ".card-deck .card:nth-child(1) div.course-enrolments" css element should contain "3"

 Scenario: Vérifie l'affichage du nombre d'étudiant inscrits si l'option est décochée.
   When I navigate to "Plugins > Flexible featured course" in site administration
   And I set the following fields to these values:
      | Displays the number of course enrols | 0 |
   And I press "Save changes"
   And I am on site homepage
   And I wait until the page is ready
   Then the ".card-deck .course-enrolments" css element should not exist

 Scenario: Vérifie l'affichage des images de cours.
   When I am on site homepage
   Then ".card-deck .card:nth-child(1) .img-course" "css_element" should be visible
   And ".card-deck .card:nth-child(2) .img-course" "css_element" should be visible
