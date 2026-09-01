# RimScent Extended: Farmyard Expansion

Livestock smells, and so does what it leaves behind. For RimWorld 1.6.

[RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466) gives ten
vanilla filth types a smell but never animal droppings — the most obvious gap the moment you
keep animals. A rotting corpse in the dining room was already covered; a barn floor was not.

## What smells

- **Animal droppings**, at a real penalty. The stench of a barn nobody has mucked out.
- **The animals themselves**, faintly, and only past a threshold — hide, hay and warm
  animal. Not foul exactly, but it clings.
- **Beehives, wild hives, mead casks, honey and propolis** (Bees): warm beeswax, thick and
  summery.
- **The insectiary** (Stoneborn Cuisine): chitin, jelly and something sharply ammoniac.

## The threshold is the game's own

An animal only smells once its `FilthRate` passes **4** — the exact value RimWorld's own
animal filth alert tests before warning you. *An animal smells when the game already thinks
it is dirty enough to complain about*, not before. A clean, well-trained beast is odourless.

That has a useful consequence. If you run **Housebroken**, which multiplies filth rate by how
house-trained an animal is, its cleanliness bonus silences the smell and the alert together —
without either mod knowing the other exists. No compatibility patch, no shared def: the two
mods meet on a number the base game already uses.

## Why the socle is required

RimScent cannot give an animal a scent on its own. Its scan reads *things at cells* and, for
neighbouring pawns, **only their hediffs** — never the race `ThingDef`. This uses
`ModExtension_PawnScent` from RimScent Extended, which adds exactly that: a scent on a pawn
def, gated on a stat threshold (`aboveStat` / `aboveValue`).

## Requirements

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- RimScent Extended (the socle)

Bees and Stoneborn Cuisine support loads only if those mods are active, through
`LoadFolders.xml`. Nothing is written to the save: it can be added to or removed from an
ongoing game.

Ships in English with a French translation injected on top, so it works in any language.

## Licence

MIT — see [LICENSE](LICENSE) and [ATTRIBUTION.md](ATTRIBUTION.md).
