Feature: Game_Search_Funcationality

Search Box
@Automatable
Scenario: Search bar returns relevant results for valid game searches

    Given the user is on the home page <"https://www.gametwist.com/en/">
    When the user enters a valid game title <"chess"> in the search bar
    And clicks on the search icon or presses Enter
    Then the system displays a results page with relevant game listings <"chess">
