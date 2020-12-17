Feature: User views socks

  Scenario: Clean socks
    Given a Sock codenamed "FESTIVE LLAMA"
    And a Sock codenamed "HIDDEN UKULELE"
    When I visit the socks page
    Then I should see "FESTIVE LLAMA"
    And I should see "HIDDEN UKULELE"
