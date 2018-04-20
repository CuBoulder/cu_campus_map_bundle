Feature: Campus Map Bundle

  @api @campus_map @javascript
  Scenario: See campus map on frontpage.
    Given  I am on "node/1"
      And I switch to the iframe "map_frame"
    Then I should see "Locations"
      And I should see "Tours"
    When I fill in "search-key" with "ARCE"
      And I click the "#search-button" element
    Then I should see "Search Results"
      And I should see "Administrative and Research Center"

  @api @campus_map @javascript
  Scenario: Get campus map embed URL.
    Given  I am on "node/1"
      And I switch to the iframe "map_frame"
      And I follow "Create a map embed URL"
    Then I should see "Change the settings below to build a custom map URL"
    When I select "2" from "Zoom Level"
      And I select "Armory" from "Map Center"
      And I select "Sidebar Closed" from "Embed Mode"
    Then I should see "https://www.colorado.edu/map/?id=336&open=0#?mc/40.010826,-105.273911?sbc?z/16"

  @api @campus_map @test
  Scenario: Manipulate campus map admin options.
    Given I am logged in as a user with the "developer" role
      And I am on "admin/config/system/campus-map"
    When I press the "Rebuild Map Data"
    Then I should see "Saved map data was deleted and will be rebuilt."
    When I uncheck "Enable campus map on front page of this site."
      And I press "Save configuration"
      And I am on "node/1"
    Then I should see "Welcome to your new Web Express website!"
