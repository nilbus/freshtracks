Feature: Search
  In order to find classes to plan into my schedule
  As a student
  I want to search through available classes by major and class number or title

  Scenario: Search with partial terms in reverse order
    Given I have logged in as a "student"
    And I am working with the "next" semester
    When I search for "  scien  1 puter "
    Then the page should show this course:
      | Subject | Number |
      | CSC     | 316    |

  Scenario: Expand all search results
    Given I have logged in as a "student"
    And I am working with the "next" semester
    When I search for "csc"
    And I double-click on an expander
    Then all the results in the group should be expanded

  Scenario: Search with partial terms in reverse order
    Given I have logged in as a "student"
    And I am working with the "next" semester
    When I type "csc 116" in the search box
    And "CSC 116" is not offered
    Then the autocomplete should not contain "CSC116 - Introduction to Computing - Java"
