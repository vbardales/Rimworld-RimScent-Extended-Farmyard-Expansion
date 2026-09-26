# Protocol reading ledger

Read on 2026-09-26 for the Farmyard Expansion at local commit
`e451728b23e157d477b497cb59261a46b0d25952`. A SHA-256 below identifies the exact content
read, including documentation maintained outside this repository.

Re-read policy: re-read a row only when it changes **and** the planned action falls within its
`Use now` scope. Rows marked `Deferred` were not useful for the current `preOptions`/test-evidence
work; do not re-read them merely because they changed.

| Document | Version read | Use now |
| --- | --- | --- |
| `../AGENTS.md` | 46 lines, `36631E7304333692CF07D7EB7968EC97FC1C2533F9FF342A8B80DFE160B8BCF0` | Required: staged workflow, evidence retention, CI boundaries. |
| `../AUDIT.md` | 232 lines, `D5DC23B06E35F79B2EE5E7D52AB25132AB45D517962C31A3C19D1D1445D5B740` | Required: authoritative gates, WSL safety, dispatcher-only runs. |
| `../MOD_SETTINGS.md` | 107 lines, `404916BC99A7F1C6FC00D7AB51D417F86FC719AB62AF023C4022F502D7A9F2C6` | Required: no-settings audit and runtime absence observation. |
| `../PUBLISHING.md` | 719 lines, `7D34F55D583D7F657CC66B899CA7D5D385584C02D1D138AF40AFE1A7D204342A` | Required for repository/About metadata; re-read for publication work. |
| `../TRANSLATIONS.md` | 112 lines, `298F74D226DA2C4B9365D65A82275D0FE80C7EDB3FE08910F6B452FBAD945792` | Required: DefInjected coverage and EN/FR gate. |
| `../STYLE_RIMWORLD.md` | 484 lines, `DE13CBE5E1F978B7357EADEDFC2DF035B857E3641B0023FD2DA6E44985FFB205` | Required for future asset QA; no asset generation authority. |
| `../WORKSHOP_COMMENTS.md` | 137 lines, `6C69A05BB42493305B2400FE39A2CFF2FF3A9196B3FD2F2671429816B39D3C69` | Deferred: Steam thank-yous only at publication. |
| `../scripts/SEARCHING.md` | 168 lines, `9DBD52B2BCD4BA66C7465C02C0E9C816B24F4251C0FD447561A315DFC15D20B4` | Deferred: no corpus-wide collision question is active. |
| `../PickleTools/README.md` | 86 lines, `628350C7BCC3ECBFA14B6FE2A4655108065FFDC3B7E07B3A6016F879A123B67F` | Required: shared-tool ownership and suite layout. |
| `../PickleTools/Headless/README.md` | 508 lines, `488A0BB2CA831792C3B6F284E6457DD6FC47BA6D0B2CF24B7E36EC6075DBB54B` | Required: passes, evidence, and dispatcher submission route. |
| `../PickleTools/docs/steps.md` | 229 lines, `0F897B4557A9B7414D95CFCCBBEA09DB3FB3CCE0DDAC463A22DAE1342678364A` | Required before using or adding Pickle steps. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | 267 lines, `F6F85474F6D3DDA1521D0FBB7625EEE324F75B07CA2CC20DBF40951E93FC3AE2` | Deferred: CI release, dry-run, tags, and Steam secrets only. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | 139 lines, `135D16D524E875FAD926588DF27920B00EEFB9A360E07C95361061072707FD21` | Required: submit, do not directly launch or monitor. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | 131 lines, `90B7385B1BDA5B88C20E053F2D68C5B07FF4E07EB885C53137CBAFA73E6D8D80` | Required: request fields, SHA label, evidence path, and result handling. |
| `STATUS.md` | 98 lines, `B6C7F1227F57217AAB296125A5E4CE6A1ACBF3856B9932271C72DC5FBCB79912` | Required: current evidence, stage, and remaining work. |
| `README.md` | 49 lines, `1C5ED0C9FD16F3644A6F275D13512E7AD414E44539F92DABBF375E490BF9AA92` | Required: public claims and feature inventory. |
| `CHANGELOG.md` | 7 lines, `67E4F1E19462F121BDA920A08FBA40F3DE78D936F3B0B520D7016383D5F30483` | Required: released-content baseline. |
| `ATTRIBUTION.md` | 27 lines, `63975A14190E52F741CE8724A0E4B5B5192E82F055C0393D816BC398239F234D` | Required: rights and credits. |
| `LICENSE` | 21 lines, `B054D95F9B2C1B9302B895C37C3E5EACEA13EDDAC7278D307C3CAE267F227892` | Required: MIT baseline. |
| `PUBLICATION.md` | Missing | Required later at `prepublished`; do not invent it before the publication inputs exist. |
| `TESTING.md` | Missing | Required before `preTest` to carry the complete test matrix. |
| `BACKLOG.md` | Missing | Not useful now: no local backlog exists. |
| `docs/runs/` | Missing | Required now: it must retain one text line per own run, not report folders. |
| `Tests/Pickle/` | 4 files, tree at `e451728` | Required: current minimal suite and pass map. |
| `Mod/About/About.xml` | 58 lines, `A3B4BE1C4DA602430479D249945087090151EAD274D601599B0981F651D9D2CF` | Required: distributed metadata, dependencies, and description. |
| `NOTES.md` | Missing | Not useful now: no technical note exists. |
| `BUGS.md` | Missing | Not useful now: no bug register exists. |
| `docs/PROTOCOLS-READ.md` | Created by this entry | Required: this reading ledger. |

## Consequences for Farmyard

- The 2026-09-22 direct launcher run predates the current dispatcher-only protocol. It is not
  used to satisfy a current gate. Any new run must be submitted through
  `Submit-PickleRun.ps1`, labelled with the tested SHA, and left for TicketDispatcher to run.
- `Tests/Pickle/Evidence/` is ignored evidence, not repository history. Keep only the current
  proving files and record each run as a compact line under `docs/runs/`.
- The current minimal pass establishes loading of two base ThoughtDefs only. It does not prove
  optional Bees/Stoneborn patches, absence of the Mod options page/MainButtons shortcut, or
  English/French rendered text.
