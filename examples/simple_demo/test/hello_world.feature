Feature: Hello World Display
    Verify that the skeleton app correctly displays "Skeleton Driver App".

    Scenario: Initial app display
        Given the app is running
        Then I see {'Skeleton Driver App'} text
