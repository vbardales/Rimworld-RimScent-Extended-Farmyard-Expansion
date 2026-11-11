@requires:nelim.pickletools.deffields @requires:nelim.pickletools.loadaudit
Feature: The base scents are wired to the right things with the promised values

  Scenario: animal droppings carry the animal filth scent
    Given the save "test-colony" is loaded
    Then Nelim's Pickle Tools: the def "Filth_AnimalFilth" of type "ThingDef" has the extension "RimScentReworked.ModExtension_Scent" with field "thought" "RimScentExtended_Scent_AnimalFilth"
    And Nelim's Pickle Tools: def "RimScentExtended_Scent_AnimalFilth" of type "ThoughtDef" field "stages.0.baseMoodEffect" is "-3"

  Scenario: an animal smells only past the game's own filth alert threshold
    Given the save "test-colony" is loaded
    Then Nelim's Pickle Tools: the def "Muffalo" of type "ThingDef" has the extension "RimScentExtended.ModExtension_PawnScent" with field "thought" "RimScentExtended_Scent_Livestock"
    And Nelim's Pickle Tools: the def "Muffalo" of type "ThingDef" has the extension "RimScentExtended.ModExtension_PawnScent" with field "aboveStat" "FilthRate"
    And Nelim's Pickle Tools: the def "Muffalo" of type "ThingDef" has the extension "RimScentExtended.ModExtension_PawnScent" with field "aboveValue" "4"
    And Nelim's Pickle Tools: def "RimScentExtended_Scent_Livestock" of type "ThoughtDef" field "stages.0.baseMoodEffect" is "-1"

  Scenario: the mod loads without logging anything
    Given the save "test-colony" is loaded
    Then Nelim's Pickle Tools: the load of the mod "nelim.rimscent.extended.farmyard" is clean
