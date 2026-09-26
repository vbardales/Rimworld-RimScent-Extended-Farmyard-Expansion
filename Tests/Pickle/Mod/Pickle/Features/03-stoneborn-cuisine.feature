@requires:det.sbcuisine
Feature: Stoneborn Cuisine integration loads its scent definition

  Scenario: active Stoneborn Cuisine support provides the insectiary scent
    Given the save "test-colony" is loaded
    Then def "RimScentExtended_Scent_Insectiary" of type "ThoughtDef" exists
    And no errors were logged
