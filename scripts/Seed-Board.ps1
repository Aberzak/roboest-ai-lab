#Requires -Version 7
<#
.SYNOPSIS
    Seeds the board of YOUR fork: turns on Issues, creates the labels and the ten case issues,
    and points gh (and so the agent) at your fork instead of the original repo.

.DESCRIPTION
    A fork copies the files but not the issues, and has Issues switched off. Run this once, from the repo root:
        pwsh ./scripts/Seed-Board.ps1 -DryRun
        pwsh ./scripts/Seed-Board.ps1
    It refuses any repo that is not owned by the account gh is logged in as.
#>
[CmdletBinding()]
param(
    [string] $Repo,      # default: <you>/roboest-ai-lab
    [switch] $DryRun
)

$ErrorActionPreference = 'Stop'
$me = & gh api user --jq .login
if ($LASTEXITCODE) { throw 'gh is not logged in: gh auth login' }
if (-not $Repo) { $Repo = "$me/roboest-ai-lab" }
# The original repo is public and accepts issues from anyone: never seed a board that is not yours.
if ($Repo.Split('/')[0] -ne $me) { throw "Refusing: $Repo is not yours (gh is logged in as $me)." }

function Write-Step([string]$t) { Write-Host "`n== $t" -ForegroundColor Cyan }

function Invoke-Gh {
    param([Parameter(Mandatory)][string[]]$Arguments, [switch]$Write, [switch]$AllowFail)
    $line = 'gh ' + (($Arguments | ForEach-Object { if ($_ -match '\s') { "'$_'" } else { $_ } }) -join ' ')
    if ($DryRun -and $Write) { Write-Host "  [dry-run] $line" -ForegroundColor Yellow; return $null }
    Write-Verbose $line
    $out = & gh @Arguments
    if ($LASTEXITCODE -ne 0) { if ($AllowFail) { return $null }; throw "gh failed ($LASTEXITCODE): $line" }
    return ($out | Out-String).Trim()
}

Write-Step "Board of $Repo"
if ($DryRun) { Write-Host '  DRY RUN: nothing will be written.' -ForegroundColor Yellow }
$existing = Invoke-Gh -AllowFail -Arguments @('issue','list','-R',$Repo,'--state','all','--limit','1','--json','number')
if ($existing -and $existing -ne '[]') {
    Write-Warning "  $Repo already has issues: not seeding again."; return
}
Invoke-Gh -Write -Arguments @('repo','edit',$Repo,'--enable-issues') | Out-Null
Push-Location (Join-Path $PSScriptRoot '..')
try { Invoke-Gh -Write -Arguments @('repo','set-default',$Repo) | Out-Null } finally { Pop-Location }
Write-Host "  gh now talks to $Repo from this folder"

# ------------------------------------------------------------ 3. labels
Write-Step 'Labels'
$labels = @(
    @('wayfinder:map','0B1B2B','A wayfinder map: its task list holds the children'),
    @('wayfinder:research','1D76DB','A fact we need, answered by /research'),
    @('wayfinder:prototype','5319E7','A question answered by building, /prototype'),
    @('wayfinder:grilling','E63926','A decision with a price, /grill-with-docs'),
    @('wayfinder:task','0E8A16','Decided work, blocked by a grilling issue'),
    @('needs-triage','FBCA04','Raw: nobody has looked yet'),
    @('needs-info','D4C5F9','Waiting for an answer from a person'),
    @('ready-for-agent','0E8A16','Clear enough for an agent in a clean context'),
    @('ready-for-human','C2E0C6','Needs judgement, a conversation or access'),
    @('wontfix','FFFFFF','Decided not to do; reason in the closing comment'),
    @('groep-a','F9D0C4','Owned by group A'), @('groep-b','F9D0C4','Owned by group B'),
    @('groep-c','F9D0C4','Owned by group C'), @('groep-d','F9D0C4','Owned by group D'),
    @('handoff','BFD4F2','Changed hands at least once')
)
foreach ($l in $labels) {
    Invoke-Gh -Write -Arguments @('label','create',$l[0],'--color',$l[1],'--description',$l[2],'--force','-R',$Repo) | Out-Null
}

# ------------------------------------------------------------ 4. seed issues
Write-Step 'Seed issues'
$fake = 100
function New-Issue([string]$Title, [string[]]$Labels, [string]$Body) {
    $f = New-TemporaryFile
    Set-Content $f.FullName $Body -Encoding utf8NoBOM
    try {
        if ($DryRun) { $script:fake++; Write-Host "  [dry-run] issue #$($script:fake): $Title  [$($Labels -join ', ')]" -ForegroundColor Yellow; return $script:fake }
        $url = Invoke-Gh -Write -Arguments @('issue','create','-R',$Repo,'--title',$Title,'--label',($Labels -join ','),'--body-file',$f.FullName)
        if ($url -notmatch '/issues/(\d+)') { throw "unexpected output: $url" }
        Write-Host "  #$($Matches[1]) $Title"
        return [int]$Matches[1]
    } finally { Remove-Item $f -ErrorAction SilentlyContinue }
}
$case = "https://github.com/$Repo/blob/main/cases"

# Case B
$b1 = New-Issue 'Research: which official Belgian rules apply to a mileage allowance for a work trip' @('wayfinder:research','groep-b','ready-for-agent') @"
Which trips count (commuting or not), which amount per kilometre applies for which period, and which proof is required?
Public primary sources only (official government pages, the law text), with the date each was read.
Answer in ``docs/research/<this issue>-mileage-allowance-rules.md``. Case card: $case/B-mileage-from-the-register.md
"@
$b2 = New-Issue 'Research: may working-time registration data be reused to calculate an allowance under the GDPR' @('wayfinder:research','groep-b','ready-for-agent') @"
GDPR article 5(1)(b) purpose limitation, and what the Belgian data protection authority publishes about further processing.
What would we need: a legal basis, information to the employee, a DPIA?
Answer in ``docs/research/<this issue>-reuse-of-working-time-data.md``. Case card: $case/B-mileage-from-the-register.md
"@
$b3 = New-Issue 'Decide: where does a work trip come from' @('wayfinder:grilling','groep-b') @"
Option A: derived from the working-time register (workplace per punch). Gives us ... costs us ...
Option B: entered by hand by the claimant. Gives us ... costs us ...
Option C: derived, then confirmed by the claimant. Gives us ... costs us ...
Run ``/grill-with-docs``; the result is ``CONTEXT.md`` entries and an ADR with the tension in its title.

Blocked by #$b1
Blocked by #$b2
"@

# Case C
$c1 = New-Issue 'Prototype: how does a claimant submit an expense line on a phone' @('wayfinder:prototype','groep-c','ready-for-agent') @"
UI prototype, three variants side by side in one file: A photo first, B form first, C batch (photos all month, one claim at the end).
Branch ``prototype/submit-on-phone``, file ``prototypes/submit-on-phone/index.html``. Plain HTML, Dutch UI labels from CONTEXT.md, fake data.
Case card: $case/C-submit-a-claim-on-a-phone.md
"@
$c2 = New-Issue 'Research: is a photo of a receipt accepted as proof, and how long must receipts be kept' @('wayfinder:research','groep-c','ready-for-agent') @"
In Belgium, for an expense reimbursement: is a photo or scan of a receipt accepted, and what is the retention period?
Public primary sources only, with the date read. Answer in ``docs/research/<this issue>-receipts-photo-and-retention.md``.
"@
$c3 = New-Issue 'Decide: photo first or form first' @('wayfinder:grilling','groep-c') @"
Which submit flow, chosen by looking at the prototype and reading the research, and what it costs us.
Run ``/grill-with-docs``; the ADR cites the prototype branch and the research note.

Blocked by #$c1
Blocked by #$c2
"@

# Case D
$d1 = New-Issue 'Prototype: the states and transitions of an expense claim, from draft to payout' @('wayfinder:prototype','groep-d','ready-for-agent') @"
Logic prototype: a clickable walkthrough of the state machine including refused, withdrawn and corrected, with the growing history of one claim.
Branch ``prototype/claim-state-machine``, file ``prototypes/claim-state-machine/index.html``.
Case card: $case/D-approve-pay-correct.md
"@
$d2 = New-Issue 'Research: what Power Automate Approvals offer for an approval flow' @('wayfinder:research','groep-d','ready-for-agent') @"
Approval types (first to respond, everyone, sequential), reassignment, what happens when nobody responds, how long a flow can wait.
Microsoft Learn and product documentation only, with the date read. Answer in ``docs/research/<this issue>-power-automate-approvals.md``.
"@
$d3 = New-Issue 'Decide: is an approved expense claim ever edited, or only corrected' @('wayfinder:grilling','groep-d') @"
Edit in place, or a new linked correction claim (the Tikklok rule)? And may the approver ever be the claimant?
Run ``/grill-with-docs``; §3 of the ADR names the test that would enforce it.

Blocked by #$d1
Blocked by #$d2
"@

# Case A: the map
$null = New-Issue 'Map: the Expenses module' @('wayfinder:map','groep-a') @"
Roboest wants an Expenses module next to Tikklok: an employee claims costs, a manager approves, finance pays.
This map holds the decisions, not the work. Group A extends it with /wayfinder; groups B, C and D own the corners below.
Case card: $case/A-map-the-expenses-module.md

### Group B: mileage from the working-time register?
- [ ] #$b1
- [ ] #$b2
- [ ] #$b3

### Group C: submit a claim on a phone
- [ ] #$c1
- [ ] #$c2
- [ ] #$c3

### Group D: approve, pay, correct
- [ ] #$d1
- [ ] #$d2
- [ ] #$d3

### Group A: the rest of the fog
<!-- /wayfinder adds research, prototype, grilling and task issues here -->
"@
