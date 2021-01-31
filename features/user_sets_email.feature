Feature: User sets email address

  Scenario: Email not already set
    Given a Sock codenamed "DECISIVE YETI"
    When I edit that Sock
    And I fill in "Email" with "dyeti@example.com"
    And I click "Update Sock"
    Then I should see "Sock was successfully updated"
    And I should see "dyeti@example.com"
