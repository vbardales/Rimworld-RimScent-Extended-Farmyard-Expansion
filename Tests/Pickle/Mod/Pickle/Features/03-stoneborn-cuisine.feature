@requires:det.sbcuisine @requires:nelim.pickletools.deffields @requires:nelim.pickletools.loadaudit
Feature: Stoneborn Cuisine integration loads its scent definition

  Scenario: active Stoneborn Cuisine support provides the insectiary scent
    Given the save "test-colony" is loaded
    Then def "RimScentExtended_Scent_Insectiary" of type "ThoughtDef" exists
    And no errors were logged

  Scenario: the artificial hive carries the insectiary scent at the promised strength
    Given the save "test-colony" is loaded
    Then Nelim's Pickle Tools: the def "SC_ArtificialHive" of type "ThingDef" has the extension "RimScentReworked.ModExtension_Scent" with field "thought" "RimScentExtended_Scent_Insectiary"
    And Nelim's Pickle Tools: def "RimScentExtended_Scent_Insectiary" of type "ThoughtDef" field "stages.0.baseMoodEffect" is "-2"
    And Nelim's Pickle Tools: the load of the mod "nelim.rimscent.extended.farmyard" is clean
