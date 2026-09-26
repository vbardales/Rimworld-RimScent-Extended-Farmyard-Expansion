# Test matrix

This declarative expansion has no save data, settings, assembly, or MainButtons shortcut.
There is therefore no manual persistence or settings test to leave pending: those categories are
not applicable, as established by `Tests/Check-Mod.ps1` and source inspection.

## Offline gate

Run `pwsh -File Tests/Check-Mod.ps1`. It parses every distributed XML file, requires the four
base/conditional scent ThoughtDefs to have French DefInjected coverage, and rejects shipped C#,
assemblies, settings implementations, and MainButtons definitions.

## Pickle gate

Every feature must run through TicketDispatcher, never from a session. Run the complete suite in
English and French against the final frozen SHA. The base pass uses
`wsl-deps.sans-facultatifs.map`; the Bees and Stoneborn passes each use a dedicated map that
stages the named optional mod. `@requires:` scenarios must be executed in their matching pass;
a requirement skip in the base pass is not validation.

No feature may carry `@wip`. There are no `@review` captures and no separate manual checklist:
the assertions are definitions and error-log checks, which are objectively reported by Pickle.

## Evidence retained

Keep only the terminal report directory for the current certification attempt under the ignored
`Tests/Pickle/Evidence/`. Immediately reduce its durable record to one summary in `docs/runs/`
with the SHA, pass map, language, `exitReason`, scenario counts, and evidence location. Delete
older or superseded report directories; do not commit them.
