---
settings_audit: not_applicable
localization: partial
translation_en: partial
translation_fr: partial
mod:          RimScent Extended: Farmyard Expansion
packageId:    nelim.rimscent.extended.farmyard
repo:         Rimworld-RimScent-Extended-Farmyard-Expansion
visibility:   public
detached:     yes
stage:        options
licence:      open
licence_at:   the same MIT base as RimScent Extended
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: Check-DefInjected.ps1 did not reach a terminal result during the 2026-09-22 audit
  - unverified: Check-XmlFields.ps1 and Check-DefRefs.ps1 did not reach terminal results in the 2026-09-22 session
  - unverified: Check-DefInjected.ps1 again ended without its terminal keys/errors summary on 2026-09-26
  - unverified: the complete dispatcher Pickle matrix has not yet produced terminal reports (base, Bees, and Stoneborn Cuisine in English and French)
  - unverified: Mod/About/PublishedFileId.txt from the 0.1.0 prepublication is not present in this checkout
session:      options:    2026-09-26, static settings and test-matrix update
updated:      2026-09-26, audit follow-up
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
