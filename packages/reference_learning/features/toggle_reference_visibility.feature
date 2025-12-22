Feature: Toggle Reference Visibility
  Scenario: User toggles reference visibility
    Given the learning page is shown
    And I do not see text "John 3:16"
    When I tap the "Toggle Reference Visibility" button
    Then I see text "John 3:16"
    When I tap the "Toggle Reference Visibility" button
    Then I do not see text "John 3:16"