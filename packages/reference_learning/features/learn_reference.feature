Feature: Learn Reference
  Scenario: User learns a reference
    Given the learning page is shown
    Then I see text "For God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life."
    And I do not see text "John 3:16"

  Scenario: User submits correct reference
    Given the learning page is shown
    When I enter "John 3:16" into the reference input
    Then I see text "Correct!"

  Scenario: User submits incorrect reference
    Given the learning page is shown
    When I enter "John 3:17" into the reference input
    Then I see text "Incorrect. Try again!"