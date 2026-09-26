@requires:adamas.bees
Feature: Bees integration loads its scent definition

  Scenario: active Bees support provides the beehive scent
    Given the save "test-colony" is loaded
    Then def "RimScentExtended_Scent_Beehive" of type "ThoughtDef" exists
    And no errors were logged
