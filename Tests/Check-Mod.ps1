$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$mod = Join-Path $root 'Mod'
$xmlFiles = Get-ChildItem $mod -Recurse -Filter '*.xml'
foreach ($file in $xmlFiles) { [xml](Get-Content -Raw $file.FullName) | Out-Null }

$defs = Select-Xml -Path (Get-ChildItem $mod -Recurse -Filter 'Scents_*.xml' |
    Where-Object { $_.FullName -notmatch '\\Languages\\' } |
    Select-Object -ExpandProperty FullName) -XPath '//ThoughtDef[defName]' |
    ForEach-Object { $_.Node.defName }
if ($defs.Count -ne 4) { throw "Expected 4 scent ThoughtDefs, found $($defs.Count)." }

$french = (Get-ChildItem $mod -Recurse -Filter 'Scents_*.xml' |
    Where-Object { $_.FullName -match '\\Languages\\French\\' } |
    ForEach-Object { Get-Content -Raw $_.FullName }) -join "`n"
$missing = @($defs | Where-Object { $french -notmatch [regex]::Escape($_ + '.stages.') })
if ($missing.Count) { throw "Missing French DefInjected coverage: $($missing -join ', ')." }

if (Get-ChildItem $mod -Recurse -Include '*.cs','*.dll' -File) {
    throw 'This declarative mod must not ship an assembly or C# source.'
}
if (rg -n -i 'MainButton|ModSettings|DoSettingsWindowContents|GetSettings' $mod) {
    throw 'A settings or MainButtons implementation was found; redo the settings audit.'
}

Write-Output "PASS: $($xmlFiles.Count) XML files, 4 French-covered scent ThoughtDefs, no settings implementation."
