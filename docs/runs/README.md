# Retained test evidence

`Tests/Pickle/Evidence/` is deliberately ignored. It may contain `Player.log`, captures, JUnit
output and NDJSON, so it is retained only on disk for the current, most relevant terminal run.
Delete superseded evidence immediately after its terminal verdict has been read.

For every retained run, commit one compact Markdown summary in this directory. It must name the
tested SHA, pass map, language, terminal `exitReason`, discovered and executed scenario counts,
and the evidence directory used. `STATUS.md` cites that summary, never a report directory.

The historical 2026-09-22 direct Pickle result has no retained evidence and predates the
dispatcher-only protocol. It is not a certification record and is intentionally not summarised
as a passing run.
