Feature: User logs in

  Scenario:
    Given a user with the email "jdoe@example.com" exists
    When I go to the home page
    Then I should get redirected to log in

    When I fill in "Email" with "jdoe@example.com"
    And I fill in "Password" with "test-password"
    And I click "Log in"
    Then I should be logged in
    And I should see "SUCCESS"
