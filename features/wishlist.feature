Feature: Switch semester context
  In order to be able to register instantly when when my registration date is available
  As a student
  I want to prepare a wishlist for the upcoming semester

  Scenario: Wishlist classes with overlapping times
    Given I have logged in as a "student"
    And I am working with the "next" semester
    When I search for "csc2"
    And I wishlist these classes:
      | CSC216 | Programming Concepts - Java                    | Jayne Cobb      | TH 09:00AM-10:30AM  |
      | CSC226 | Discrete Mathematics for Computer Scientists   | Malcom Reynolds | TH 08:00AM-09:15AM  |
    Then my wishlist should contain these classes:
      | CSC216 | Programming Concepts - Java                    | Jayne Cobb      | TH 09:00AM-10:30AM  |
      | CSC226 | Discrete Mathematics for Computer Scientists   | Malcom Reynolds | TH 08:00AM-09:15AM  |

  Scenario: Conflicts are noted
    Given that I have logged in as a "student"
    And I am working with the "current" semester
    And I have these classes in my wishlist:
      | CSC216 | Programming Concepts - Java                    | Jayne Cobb      | TH 09:00AM-10:30AM  |
      | CSC226 | Discrete Mathematics for Computer Scientists   | Malcom Reynolds | TH 08:00AM-09:15AM  |
    When I navigate to the "Wishlist" page
    Then there should be a highlight on these classes:
      | CSC216 | Programming Concepts - Java                    | Jayne Cobb      | TH 09:00AM-10:30AM  |
      | CSC226 | Discrete Mathematics for Computer Scientists   | Malcom Reynolds | TH 08:00AM-09:15AM  |
    And I should see a caption that contains "conflict"

  Scenario: Not eligible to take a class
    Given that I have logged in as a "student"
    And I am working with the "current" semester
    And I have this class in my wishlist:
      | CSC911 | Elite Topics in Computer Science               | Morpheus        | MWF 01:00AM-05:00AM |
    When I navigate to the "Wishlist" page
    Then there should be a highlight on this class:
      | CSC911 | Elite Topics in Computer Science               | Morpheus        | MWF 01:00AM-05:00AM |
    And I should see a caption that contains "not"
    And this class should not have an "Add to wishlist" button:
      | CSC911 | Elite Topics in Computer Science               | Morpheus        | MWF 01:00AM-05:00AM |

  Scenario: Past add date
    Given I have logged in as a "student"
    And I am working with the "current" semester
    And the add deadline has passed
    When I search for "csc326"
    And I expand the course "CSC326"
    Then the course "CSC326" should not have an "Add to wishlist" button

  Scenario: Add a single class from the wishlist
    Given that I have logged in as a "student"
    And I am working with the "current" semester
    And I have these classes in my wishlist:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
      | ENG101 | Academic Writing and Research | Malcom Reynolds | TH 08:00AM-09:15AM  |
    When I navigate to the "Wishlist" page
    And I click on "Add to Schedule" for this class:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
    Then I should not see this class in my wishlist:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
    And I should see this class in my schedule:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |

  Scenario: Add all classes on the wishlist
    Given that I have logged in as a "student"
    And I am working with the "current" semester
    And I have these classes in my wishlist:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
      | ENG101 | Academic Writing and Research | Malcom Reynolds | TH 08:00AM-09:15AM  |
    When I navigate to the "Wishlist" page
    And I click on the link "Add all classes to schedule"
    Then I should not see these classes in my wishlist:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
      | ENG101 | Academic Writing and Research | Malcom Reynolds | TH 08:00AM-09:15AM  |
    And I should see these classes in my schedule:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
      | ENG101 | Academic Writing and Research | Malcom Reynolds | TH 08:00AM-09:15AM  |

  Scenario: Remove classes from wishlist
    Given that I have logged in as a "student"
    And I am working with the "current" semester
    And I have these classes in my wishlist:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
      | ENG101 | Academic Writing and Research | Malcom Reynolds | TH 08:00AM-09:15AM  |
    When I navigate to the "Wishlist" page
    And I click on "Remove from Wishlist" for this class:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
    Then I should not see this class in my wishlist:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
    And I should not see this class in my schedule:
      | CSC326 | Software Engineering          | Harper Lee      | MWF 01:45PM-02:35PM |
