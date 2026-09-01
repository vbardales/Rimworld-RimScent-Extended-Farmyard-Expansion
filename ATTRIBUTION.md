# Attribution

## RimScent

by **reo / ocarina0001** — MIT.
[Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)

This mod is a companion, not a fork. No file from RimScent is copied or redistributed. It
declares RimScent as a hard dependency and uses `RimScentReworked.ModExtension_Scent`, its
own public extension point, plus `ModExtension_PawnScent` from RimScent Extended.

## Mods this expansion reads

Nothing is copied from any of them. Each is targeted by `PatchOperation`s only, in a folder
that loads solely when the mod is active:

- **Bees** (`adamas.bees`) — hives, mead casks, honey, propolis.
- **Stoneborn Cuisine** (`det.sbcuisine`) — the insectiary.

## Housebroken

by **nelim** — the interaction with it is deliberate but requires no coupling whatsoever.
Both mods act on `FilthRate`; neither references the other.

## This mod

MIT, © nelim. Defs, patches, thresholds and translations are original work.
