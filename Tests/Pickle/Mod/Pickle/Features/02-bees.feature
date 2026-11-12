@requires:sarg.rimbees @requires:nelim.pickletools.deffields @requires:nelim.pickletools.loadaudit
Feature: Bees integration loads its scent definition

  Scenario: active Bees support provides the beehive scent
    Given the save "test-colony" is loaded
    Then def "RimScentExtended_Scent_Beehive" of type "ThoughtDef" exists
    And no errors were logged

  Scenario: the beehive carries the beehive scent at the promised strength
    Given the save "test-colony" is loaded
    Then Nelim's Pickle Tools: the def "RB_Beehouse" of type "ThingDef" has the extension "RimScentReworked.ModExtension_Scent" with field "thought" "RimScentExtended_Scent_Beehive"
    And Nelim's Pickle Tools: def "RimScentExtended_Scent_Beehive" of type "ThoughtDef" field "stages.0.baseMoodEffect" is "2"
    And Nelim's Pickle Tools: the load of the mod "nelim.rimscent.extended.farmyard" is clean
