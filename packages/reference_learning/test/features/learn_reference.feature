Feature: Reference Learning
    As a user, I want to learn scripture references.

    Scenario: Initial display of a verse
        Given the learning page is shown
        Then I see {'who is the image of the invisible God, the firstborn of all creation.'} text
        And I do not see {'Col 1:15'} text
