Feature: User adds notes to Sock

  Scenario: Existing Sock
    Given a Sock codenamed "SPACE CLARINET"
    When I edit that Sock
    And I fill in "Notes" with "Needs social media accounts."
    And I click "Update Sock"
    Then I should see "Sock was successfully updated"
    And I should see "Needs social media accounts."
