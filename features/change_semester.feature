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
      | Number | Name                                    | Instructor | Times               |
      | CSC326 | Software Engineering                    | Harper Lee | MWF 01:45PM-02:35PM |
    And my schedule for the "next" semester has this class scheduled:
      | Number | Name                                    | Instructor | Times               |
      | CSC316 | Data Structures for Computer Scientists | Sauron     | TH 11:45AM-01:00PM  |
    When I select the "current" semester
    Then the layout should indicate that I am working with the "current" semester
    And my schedule should have this class:
      | Number | Name                                    | Instructor | Times               |
      | CSC326 | Software Engineering                    | Harper Lee | MWF 01:45PM-02:35PM |

  Scenario: Change semester after the initial selection
    Given I have logged in as a "student"
    And I am working with the "current" semester
    When I click on "Change semester"
    And I select the "next" semester
    Then the layout should indicate that I am working with the "next" semester
