---
settings_audit: partial
localization: complete
translation_en: complete
translation_fr: complete
mod:          RimScent Extended: Farmyard Expansion
packageId:    nelim.rimscent.extended.farmyard
repo:         Rimworld-RimScent-Extended-Farmyard-Expansion
remote:       https://github.com/vbardales/Rimworld-RimScent-Extended-Farmyard-Expansion.git
visibility:   public
detached:     yes
workflow_stage: writeTests[1.0.0]
licence:      open
licence_at:   the same MIT base as RimScent Extended
upstream_mod_remotes: N/A      # RimScent (3645569466) is Steam only, no public git repository found 2026-09-26
dependencies: declared
workshop_required_items: n/a, not released yet
showcase:     complete
tested_on:
workshop:
remaining:
  - open 7.b: Tests/Test-Mod.ps1 not generated yet (asked CI/CD 2026-11-11), Rule-OwnValues.ps1 awaits Audit validation
  - unverified: the complete dispatcher Pickle matrix has not yet produced terminal reports (base, Bees, and Stoneborn Cuisine in English and French)
  - unverified: Mod/About/PublishedFileId.txt (3811307974, matches the installed Workshop item) is untracked, decide whether to commit it
  - unverified: settings audit runtime check (no empty Mod options page, no visible or greyed MainButtons shortcut in a clean game), planned for playTests
  - unverified: in-game display of the EN and FR texts (raw keys, fallback, clipping), planned for playTests
  - open 7.a: Pickle scenarios only assert that defs exist and no error is logged; no scenario per promised behavior (animal filth, livestock FilthRate 4, Bees, Stoneborn), PUBLICATION.md absent
session:      options:    2026-09-26, static settings and test-matrix update
updated:      2026-11-11, writeTests replay: 7.c green, 7.b and 7.a open
protocols_read_sha: ef13379748eaf57e42f8b2c03648c2d41f1604a6
---

# RimScent Extended: Farmyard Expansion — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Four cannot be, and wait for whoever
holds this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## Audit — 2026-09-22

Audited against `AUDIT.md`, `PUBLISHING.md`, `MOD_SETTINGS.md`, `TRANSLATIONS.md`, and
`STYLE_RIMWORLD.md`. The repository is now an autonomous Git repository with its own
`origin` remote and pushed `main` branch. The `horsMonoRepo` transition is complete.

After the documentation remediation, `preOptions` is the last cumulatively justified stage:
the required root/distributed licence and attribution files, changelog, Git attributes/ignore
rules, repository URL, and final `Source code on GitHub` description link are present. Direct
inspection of Preview and ModIcon remains the evidence for the image stages. The WSL palette
measurement could not start because WSL returned `E_ACCESSDENIED`; it is not presented as a
successful palette check.

Static checks passed:

- All 11 distributed XML files parsed successfully.
- `Mod/About/Preview.png` is 896 x 504 and 615,328 bytes; `Mod/About/ModIcon.png` is
  128 x 128 and 24,266 bytes. Both are within their delivered-file limits.
- The root and distributed `LICENSE` files have the same SHA-256:
  `AE6AE5FA894C78BB5C5B661AC6B51A86CEED7B5D596F2A7B2981218B16B26A94`.
- The four English ThoughtDefs (animal filth, livestock, Bees, and Stoneborn Cuisine) have
  matching nonempty French DefInjected label and description entries. English is supplied by
  the source Def values. The optional translations are located under the same LoadFolders
  gates as their respective defs.
- The Farmyard pawn-scent patch uses `aboveStat=FilthRate` and `aboveValue=4`; inspection of
  the base extension confirms its predicate is `>=`, consistent with the documented threshold.

Settings audit: `partial`. This content-only expansion exposes no configurable behavior or
XML setting, and static inspection found neither a settings page nor a MainButtons shortcut.
That is a credible `not_applicable` candidate, but the required clean-game confirmation that
there is no empty Mod options page or visible/greyed shortcut has not run. No settings UI was
created because the inventory found no useful player setting.

Translation audit: `partial`. The static inventory and XML parsing passed as described above.
`scripts/Check-DefInjected.ps1 -TransMod .\\Mod` was started, but it emitted only
`Patch operations applied: 34` and did not produce its required keys/errors summary in the
available audit run. Its result is therefore unverified, not a pass. English/French in-game
display, fallback, and layout checks also remain unverified.

No RimWorld or Pickle run was launched: this repository has no `Tests/`, `TEST_SCENARIOS.md`,
or Pickle feature to execute, so an in-game run would not validate the missing requirements.

Direct visual inspection passed for the delivered images: the Preview visibly contains the
Farmyard scene, readable title and summary, and a 1.6 corner badge; the ModIcon has one
readable mascot and farmyard motif at its native 128 x 128 size. The artwork source is
`Art/Preview-source.png` (1254 x 1254), rather than the current `Art/Preview.png`
convention. Palette measurement and the associated source/overlay composition records remain
unverified.

## Audit follow-up — 2026-09-26

Re-read `AUDIT.md` at the version recorded in `docs/PROTOCOLS-READ.md`. The static settings
check is now established: `pwsh -NoProfile -File Tests/Check-Mod.ps1` passed, parsing all 11
distributed XML files and finding no settings implementation, MainButtons definition, assembly,
or C# source. Under the current audit rule, the content-only mod therefore has no applicable
settings, persistence, or shortcut test and the cumulatively justified stage advances from
`preOptions` to `options`.

`TESTING.md` defines the complete six-pass certification matrix. The base, Bees, and Stoneborn
Cuisine scenarios have no `@wip`; the optional features are tagged with their actual package IDs
and must run through TicketDispatcher in both English and French. Evidence reports are ignored
on disk under `Tests/Pickle/Evidence/`; only the current terminal evidence and compact
`docs/runs/` summary may remain. No ticket watcher or Codex heartbeat will be created: the
TicketDispatcher owns monitoring.

The two optional map IDs were checked against their Workshop pages: Alpha Bees `1558161673` and
Stoneborn - Cuisine `3725224779`. The original RimScent source was found on Steam only; no
public Git repository was found in the targeted search, so upstream PRs to it are not currently
available. RimScent Extended, the declared engine dependency, is a separate clean Git repository
at `../RimScentExtended` with origin `https://github.com/vbardales/Rimworld-RimScent-Extended.git`.

The 0.1.0 prepublication was reported by the owner, but its generated
`Mod/About/PublishedFileId.txt` has not appeared in this checkout or the default local RimWorld
Mods directory. Until its exact generated file is copied here, the prepublication cannot be
recorded as a reproducible repository state.

## Dependencies — 2026-11-11 (AUDIT.md 4.a to 4.g)

Read from `About.xml`, `LoadFolders.xml`, `Patches/` and `Mod/About/OptionalCompat.xml` at commit 24233aa.

- **Required** (`modDependencies`): RimScent `reo.RimScent` (Workshop 3645569466, carries the
  scent system) and RimScent Extended `nelim.rimscent.extended` (engine, `ModExtension_PawnScent`).
- **Load order** (`loadAfter`): Harmony, Core, both required mods, plus `adamas.bees` and
  `det.sbcuisine` so their defs exist when the optional folders load. No `loadBefore`, no cycle
  (read by hand; `sort-load-order.py` needs a full mods directory and was not run).
- **Optional folders** (`LoadFolders.xml`, `<v1.6>` only): `Bees` when `adamas.bees` is active
  (Workshop 1558161673), `StonebornHive` when `det.sbcuisine` is active (Workshop 3725224779).
  Both are ordering-only, so they sit in `loadAfter` and not in `OptionalCompat.xml`.
- **Optional compat** (`OptionalCompat.xml`, `Check-OptionalCompat.ps1` OK, 1 target): Vanilla
  Traits Expanded `vanillaexpanded.vanillatraitsexpanded` (Workshop 2296404655, kind patch),
  trait `VTE_Desensitized` added to anosmic traits through `MayRequire` on the element.
- **DLC**: none. `supportedVersions` holds 1.6 only.
- **Animal integrations (4.f)**: n/a, the mod adds scents, not an animal.
- **Workshop required items**: `n/a, not released yet` (owner decision 2026-11-10, to be set at
  `prepareRelease`).

## Settings audit — 2026-11-11 (MOD_SETTINGS.md 1 to 5, AUDIT.md 5.a to 5.h)

Replaces the 2026-09-26 static result, which rested on `Tests/Check-Mod.ps1` (deleted 2026-11-06).
Read at commit 44993b3.

- **Inventory (5.a):** the mod ships only XML defs and patches: four ThoughtDefs, the filth and
  livestock extensions, and two conditional folders (Bees, StonebornHive). The only tunable is
  the animal-filth threshold (`aboveStat=FilthRate`, `aboveValue=4`), a balance constant of the
  patch, with no stated player need to change it.
- **Decision (5.b):** no settings. Adding one would be decorative; the threshold stays in XML.
- **Static proof (5.f, partial):** `git ls-files Mod` lists no DLL, no `.cs`, no `Source/`
  folder; a search of `Mod/` XML for `MainButtonDef`, `ModSettings`, `SettingsCategory` and
  `Keyed` finds nothing. So no settings page and no MainButtons shortcut are shipped (5.c, 5.d
  n/a, 5.e n/a).
- **Not checked:** in a clean game, no empty Mod options page and no visible or greyed shortcut.
  Needs the game: `settings_audit` stays `partial` until `playTests` (AUDIT.md section 5 intro).

## Translation audit — 2026-11-11 (TRANSLATIONS.md, AUDIT.md 6.a to 6.h)

Read at commit 54d26b8, `Mod/` unchanged since.

- **Inventory (6.a):** four ThoughtDefs (animal filth, livestock in the base folder; beehive in
  `Bees`; insectiary in `StonebornHive`), each with a label and a description: 8 texts. No C#,
  no `Keyed`, no setting, no letter, no hard-coded string.
- **English (6.b, 6.c):** the source Def values are the English text (native mechanism). 
- **French (6.c):** `Languages/French/DefInjected/ThoughtDef/` in the base folder and in each
  optional folder, under the same `LoadFolders` gates as the defs. `Check-Translations.ps1`:
  PASS, 8 source texts, French injections, no stale entry, no duplicate.
  `Check-DefInjected.ps1 -TransMod Mod` ended with `Keys checked: 8 - errors: 0` on 2026-11-11
  (patch operations 34, four load states: base, +adamas.bees, +det.sbcuisine, all). This closes
  the three earlier runs that never printed their summary.
- **Agreement and address (6.d):** read all eight French texts: no pawn-dependent sentence, no
  `tu`, `vous`, `nous` or imperative to the player. No agreement segment needed.
- **Player choice (6.e):** n/a, no gendered French text.
- **`TRANSLATION_REVIEW.md` (6.f):** generated by `Make-TranslationReview.ps1`.
- **French review (6.g):** validated by Virginie on 2026-11-11 at revision 964a983. Corrections: two from the ChatGPT review applied (ammoniacal in the English source, no comma before "et" in the French), one rejected (PUBLICATION.md absent, not due before prepublished); a second review changed nothing.
- **Not checked:** in-game display (raw keys, fallback, clipping), left to `playTests`.

## Tests — 2026-11-11 (AUDIT.md 7.a to 7.h)

Read at the commit that adds `Tests/Rule-OwnValues.ps1`.

- **7.b automated tests:** no unit-test project (`Run-UnitTests.ps1`: n/a), declarative mod with
  nothing to compile. `Tests/Rule-OwnValues.ps1` passes (identity, four scents, FilthRate 4
  gate, optional folders and compat, content-only); mutation proof: changing one `aboveValue`
  to 5 makes it fail. Declared in `scripts/LOCAL_SCRIPTS.md`, awaiting Audit validation.
  `Tests/Test-Mod.ps1` to be generated by CI/CD.
- **7.c XML tests, green 2026-11-11:** `Check-ModBasics` PASS (12 XML files), `Check-PatchTargets`
  PASS (8 of 8 operations), `Check-DefRefs` (no missing reference, all ParentName resolved),
  `Check-XmlFields` (9 files, no unknown field), `Check-DefInjected` (8 keys, 0 errors),
  `Check-Translations` PASS.
- **7.d Pickle suites:** three features in `Tests/Pickle/Mod/Pickle/Features/`, `@requires`
  `adamas.bees` and `det.sbcuisine` with a dedicated dependency map each, no `@wip`. Not run.
- **7.a, 7.f, 7.h:** open, see `remaining`. No run exists yet (`docs/runs/` empty of results).
