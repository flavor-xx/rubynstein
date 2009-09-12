Feature: Manage Users
    In order to register a user
    As a normal user
    I want to create and edit a my user

    Scenario: Users List
        Given I have users with login flavor, marion
        When I go to user login
        Then I should see "Successfully logged in."
