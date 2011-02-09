Feature: Change semester
  In order to keep track of what I'm working with
  As a student or faculty member
  I want to select the semester that I'm working with

  Scenario: Prompt for semester after login
    Given I have not logged in
    When I log in as a "student"
    Then I should have to select which semester I want to work with

  Scenario: Redirect to semester selection if I never selected one
    Given I have not logged in
    When I log in as a "student"
    And I go to the wishlist sections page
    Then I should have to select which semester I want to work with

  Scenario: Select semester after login
    Given I have logged in as a "student"
    And my schedule for the "current" semester has this class scheduled:
      | Subject | Number | Instructor                 |
      | ENG     | 101    | Bob Woodward               |
    And my schedule for the "next" semester has this class scheduled:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
    When I select the "current" semester
    Then the layout should indicate that I am working with the "current" semester
    And my schedule should have this class:
      | Subject | Number | Instructor                 |
      | ENG     | 101    | Bob Woodward               |

  Scenario: Change semester after the initial selection
    Given I have logged in as a "student"
    And I am working with the "current" semester
    When I select the "next" semester
    Then the layout should indicate that I am working with the "next" semester
