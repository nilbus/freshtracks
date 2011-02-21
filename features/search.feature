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

