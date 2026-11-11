# What only this mod asserts: its identity, its four scent ThoughtDefs (mood effect, stack, duration), the FilthRate 4
# threshold that gates the livestock smell, the two optional folders and their gates, and the declared optional compat.
# The generic checks (XML, defNames, About.xml shape, patch targets, translation coverage) are the shared scripts', run by Test-Mod.ps1.
# Takes -ModRoot (repository root) and -SharedDir (unused, kept for the Test-Mod.ps1 contract); prints findings, exits 1 on any.
param([string]$ModRoot = (Join-Path $PSScriptRoot '..'), [string]$SharedDir)
$ErrorActionPreference = 'Stop'
$ModRoot = (Resolve-Path -LiteralPath $ModRoot).Path
$mod = Join-Path $ModRoot 'Mod'
$script:findings = New-Object System.Collections.Generic.List[string]
function Assert-True($Condition, [string]$Message) { if (-not $Condition) { $script:findings.Add("FAIL: $Message") } }

$meta = [xml](Get-Content (Join-Path $mod 'About/About.xml') -Raw -Encoding UTF8)
Assert-True ($meta.ModMetaData.packageId -ceq 'nelim.rimscent.extended.farmyard') 'packageId nelim.rimscent.extended.farmyard'
Assert-True (@($meta.ModMetaData.supportedVersions.li) -contains '1.6') 'RimWorld 1.6 declared'
$deps = @($meta.ModMetaData.modDependencies.li.packageId)
Assert-True ($deps.Count -eq 2 -and $deps -contains 'reo.RimScent' -and $deps -contains 'nelim.rimscent.extended') 'Exactly two hard dependencies: reo.RimScent and nelim.rimscent.extended'
$after = @($meta.ModMetaData.loadAfter.li)
foreach ($id in 'reo.RimScent', 'nelim.rimscent.extended', 'adamas.bees', 'det.sbcuisine') { Assert-True ($after -contains $id) "loadAfter holds $id" }
Assert-True (@($deps | Where-Object { $_ -in 'adamas.bees', 'det.sbcuisine' }).Count -eq 0) 'The optional integrations are never hard dependencies'

# The four scents: defName, mood effect, stack limit, duration.
$expected = @(
    @{ File = 'Defs/Scents_Animals.xml';                    Def = 'RimScentExtended_Scent_AnimalFilth'; Mood = '-3'; Stack = '4' },
    @{ File = 'Defs/Scents_Animals.xml';                    Def = 'RimScentExtended_Scent_Livestock';   Mood = '-1'; Stack = '4' },
    @{ File = 'Bees/Defs/Scents_Bees.xml';                  Def = 'RimScentExtended_Scent_Beehive';     Mood = '2';  Stack = '2' },
    @{ File = 'StonebornHive/Defs/Scents_Insectiary.xml';   Def = 'RimScentExtended_Scent_Insectiary';  Mood = '-2'; Stack = '2' }
)
foreach ($e in $expected) {
    $xml = [xml](Get-Content (Join-Path $mod $e.File) -Raw -Encoding UTF8)
    $def = @($xml.Defs.ThoughtDef | Where-Object { $_.defName -ceq $e.Def })
    Assert-True ($def.Count -eq 1) "$($e.Def) defined once in $($e.File)"
    if ($def.Count -eq 1) {
        Assert-True ($def[0].stages.li.baseMoodEffect -ceq $e.Mood) "$($e.Def) baseMoodEffect $($e.Mood)"
        Assert-True ($def[0].stackLimit -ceq $e.Stack) "$($e.Def) stackLimit $($e.Stack)"
        Assert-True ($def[0].durationDays -ceq '0.1') "$($e.Def) durationDays 0.1"
    }
}

# The livestock smell starts at FilthRate 4, the vanilla animal filth alert threshold; both branches of the patch say so.
$animals = Get-Content (Join-Path $mod 'Patches/Animals.xml') -Raw -Encoding UTF8
Assert-True (([regex]::Matches($animals, '<aboveStat>FilthRate</aboveStat>\s*<aboveValue>4</aboveValue>')).Count -eq 2) 'Livestock smell gated at FilthRate 4 in both patch branches'

# The optional folders load only when their mod is active.
$lf = Get-Content (Join-Path $mod 'LoadFolders.xml') -Raw -Encoding UTF8
Assert-True ($lf -match '<li IfModActive="adamas\.bees">Bees</li>') 'Bees folder gated by adamas.bees'
Assert-True ($lf -match '<li IfModActive="det\.sbcuisine">StonebornHive</li>') 'StonebornHive folder gated by det.sbcuisine'

# Optional compat: the one patched third-party mod, Vanilla Traits Expanded.
$oc = Get-Content (Join-Path $mod 'About/OptionalCompat.xml') -Raw -Encoding UTF8
Assert-True ($oc -match 'vanillaexpanded\.vanillatraitsexpanded') 'OptionalCompat declares Vanilla Traits Expanded'

# Content-only mod: nothing compiled, no settings, no shortcut.
Assert-True (@(Get-ChildItem $mod -Recurse -File -Include *.dll, *.cs -ErrorAction SilentlyContinue).Count -eq 0) 'No assembly or C# shipped'
Assert-True (-not (Test-Path (Join-Path $ModRoot 'Source'))) 'No Source folder'
$all = (Get-ChildItem $mod -Recurse -File -Filter *.xml | ForEach-Object { Get-Content $_.FullName -Raw -Encoding UTF8 }) -join "`n"
Assert-True ($all -notmatch 'MainButtonDef|ModSettings|SettingsCategory') 'No settings page and no MainButtons shortcut'

if ($script:findings.Count) { $script:findings | ForEach-Object { Write-Host $_ -ForegroundColor Red }; exit 1 }
Write-Host 'PASS: identity, four scents, FilthRate 4 gate, optional folders and compat, content-only checked.'
