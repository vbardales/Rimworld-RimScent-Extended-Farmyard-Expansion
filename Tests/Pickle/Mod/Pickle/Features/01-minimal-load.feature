Feature: RimScent Farmyard Expansion loads without optional integrations

  Scenario: the minimal dependency set loads representative scent definitions
    Given the save "test-colony" is loaded
    Then def "RimScentExtended_Scent_AnimalFilth" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Livestock" of type "ThoughtDef" exists
    And no errors were logged
