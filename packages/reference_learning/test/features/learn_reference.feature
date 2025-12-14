Feature: Reference Learning
    As a user, I want to learn scripture references.

    Scenario: Initial display of a verse
        Given the learning page is shown
        Then I see {'who is the image of the invisible God, the firstborn of all creation.'} text
        And I do not see {'Col 1:15'} text

    Scenario: User enters correct reference
        Given the learning page is shown
        When I enter {'Col 1:15'} text into the reference input
        Then I see {'Correct!'} text

    Scenario: User enters incorrect reference
        Given the learning page is shown
        When I enter {'Wrong 1:1'} text into the reference input
        Then I see {'Incorrect.'} text
        And I see {'The correct reference was: Col 1:15'} text

    Scenario: User toggles reference visibility
        Given the learning page is shown
        When I tap the toggle reference visibility button
        Then I see {'Correct Reference: Col 1:15'} text
        And I see {'Hide Reference'} text
        When I tap the toggle reference visibility button
        Then I do not see {'Correct Reference: Col 1:15'} text
        And I see {'Show Reference'} text
