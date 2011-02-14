Feature: Switch semester context
  In order to be able to register instantly when when my registration date is available
  As a student
  I want to prepare a wishlist for the upcoming semester

  Scenario: Wishlist classes with overlapping times
    Given I have logged in as a "student"
    And I am working with the "next" semester
    When I search for "csc2"
    And I wishlist these classes:
      | Subject | Number | Instructor                 | Times           |
      | CSC     | 216    | Jamison                    | MWF 09:10-10:00 |
      | CSC     | 226    | Malcolm Reynolds           | MW  09:00-10:15 |
    Then my wishlist should have these classes:
      | Subject | Number | Instructor                 | Times           |
      | CSC     | 216    | Jamison                    | MWF 09:10-10:00 |
      | CSC     | 226    | Malcolm Reynolds           | MW  09:00-10:15 |

  Scenario: Scheduling conflicts are noted
    Given I have logged in as a "student"
    And I am working with the "current" semester
    And my wishlist has these classes:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Jamison                    |
      | CSC     | 226    | Malcolm Reynolds           |
    When I navigate to the "Wishlist" page
    Then there should be a highlight on these classes:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Jamison                    |
      | CSC     | 226    | Malcolm Reynolds           |
    And I should see a caption that contains "conflict"

  Scenario: Not eligible to take a class
    Given I have logged in as a "student"
    And I am working with the "current" semester
    And "CSC 911" has a prerequisite of "CSC 901"
    And I have not taken "CSC 911"
    And my wishlist has this class:
      | Subject | Number | Instructor                 |
      | CSC     | 911    | Morpheus                   |
    When I navigate to the "Wishlist" page
    Then there should be a highlight on this class:
      | Subject | Number | Instructor                 |
      | CSC     | 911    | Morpheus                   |
    And I should see a caption that contains "not"
    And this class should not have an "Add to Schedule" button:
      | Subject | Number | Instructor                 |
      | CSC     | 911    | Morpheus                   |

  Scenario: Past add date
    Given I have logged in as a "student"
    And I am working with the "current" semester
    And the "current" semester's add deadline has passed
    When I search for "csc326"
    And I expand the course "CSC326"
    Then the course "CSC326" should not have an "Add to wishlist" button

  Scenario: Add a single class from the wishlist to my schedule
    Given I have logged in as a "student"
    And I am working with the "current" semester
    And my wishlist has these classes:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
      | ENG     | 101    | Bob Woodward               |
    When I navigate to the "Wishlist" page
    And I click on "Add to Schedule" for this class:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
    Then my wishlist should not have this class:
      | Subject | Number | Instructor                 |
      | ENG     | 101    | Bob Woodward               |
    And my schedule should have this class:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |

  Scenario: Add all classes on the wishlist
    Given I have logged in as a "student"
    And I am working with the "current" semester
    And my wishlist has these classes:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
      | ENG     | 101    | Bob Woodward               |
    When I navigate to the "Wishlist" page
    And I click on the (pending) link "Add all classes to schedule"
    Then my wishlist should not have these classes:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
      | ENG     | 101    | Bob Woodward               |
    And my schedule should have these classes:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
      | ENG     | 101    | Bob Woodward               |

  Scenario: Remove classes from wishlist
    Given I have logged in as a "student"
    And I am working with the "current" semester
    And my wishlist has these classes:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
      | ENG     | 101    | Bob Woodward               |
    When I navigate to the "Wishlist" page
    And I click on "Remove from Wishlist" for this class:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
    Then my wishlist should not have this class:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
    And my schedule should not have this class:
      | Subject | Number | Instructor                 |
      | CSC     | 216    | Bob Dylan                  |
