# Pickle test suite

Development-only companion for RimScent Extended: Farmyard Expansion. It is never included in
`Mod/` or uploaded to the Workshop.

`01-minimal-load.feature` is the minimal pass. It loads Farmyard with RimScent and the local
RimScent Extended engine, asserts the two base scent definitions, and rejects logged errors.
Bees and Stoneborn Cuisine are deliberately absent from this pass; their conditional patches
need separate optional-integration passes before they can be claimed verified.

The settings audit has no useful settings to exercise. `Tests/Check-Mod.ps1` verifies offline
that this declarative mod ships no assembly, settings implementation, or MainButtons definition.
The remaining runtime observation is that Mod options presents no empty page and that the main
bar has no visible or disabled shortcut. It must be confirmed from the in-game review, never
inferred from a green feature.

Run only through the shared launcher:

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod RimScentExtendedFarmyardExpansion -DepMap wsl-deps.sans-facultatifs.map -Language English
```
