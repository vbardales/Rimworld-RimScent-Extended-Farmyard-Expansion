# Pickle test suite

Development-only companion for RimScent Extended: Farmyard Expansion. It is never included in
`Mod/` or uploaded to the Workshop.

`01-minimal-load.feature` is the base pass. It loads Farmyard with RimScent and the local
RimScent Extended engine, asserts the two base scent definitions, and rejects logged errors.
`02-bees.feature` and `03-stoneborn-cuisine.feature` are conditional: their respective maps
must stage the optional target so their `@requires:` scenarios execute rather than skip.

The settings audit has no useful settings to exercise. `Tests/Check-Mod.ps1` verifies offline
that this declarative mod ships no assembly, settings implementation, or MainButtons definition.
The remaining runtime observation is that Mod options presents no empty page and that the main
bar has no visible or disabled shortcut. It must be confirmed from the in-game review, never
inferred from a green feature.

Submit each pass only through TicketDispatcher; it is the sole ticket watcher and launcher.
Use the final frozen SHA in the label, one request per map and language:

```powershell
powershell.exe -ExecutionPolicy Bypass -File ..\Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 `
  -Mod RimScentExtendedFarmyardExpansion -Owner local_<session-id> `
  -Label "RimScent Extended: Farmyard Expansion local_<session-id> <SHA> <pass> <language>" `
  -DepMap wsl-deps.sans-facultatifs.map -Language English `
  -EvidenceDir Tests/Pickle/Evidence/<attempt>
```

For certification, submit six passes: base, Bees, and Stoneborn Cuisine in English and French.
Inspect each terminal report for `exitReason: passed`, the expected executed conditional scenario,
and no errors. No session-created heartbeat or watcher is permitted.
