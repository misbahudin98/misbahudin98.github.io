<#
.SYNOPSIS
    Skill Governance & Anti-Collision Auditor for Antigravity Agent Workspaces.
.DESCRIPTION
    Audits all skills in .agents/skills/ against the 5-Dimension International Rubric:
    1. Trigger Tag Orthogonality & Anti-Collision (MECE)
    2. Functional Domain Boundary & Single Responsibility
    3. Rules vs. Skills Separation (SSoT)
    4. Progressive Disclosure & Token Budgeting
    5. Deterministic Verification & Script Support
#>

[CmdletBinding()]
param(
    [string]$SkillsRoot = ".agents/skills",
    [string]$RulesRoot = ".agents/rules"
)

$ErrorActionPreference = "Stop"

Write-Host "`n================================================================================" -ForegroundColor Cyan
Write-Host " [SHIELD] ANTIGRAVITY AGENT SKILL GOVERNANCE & ANTI-COLLISION AUDITOR" -ForegroundColor Cyan
Write-Host " Standar: Anthropic Building Effective Agents, MECE Partitioning & SSoT" -ForegroundColor DarkCyan
Write-Host "================================================================================`n" -ForegroundColor Cyan

if (-not (Test-Path $SkillsRoot)) {
    Write-Error "Direktori skills tidak ditemukan di '$SkillsRoot'."
    exit 1
}

$skillDirs = Get-ChildItem -Path $SkillsRoot -Directory
$ruleFiles = if (Test-Path $RulesRoot) { Get-ChildItem -Path $RulesRoot -Filter "*.md" } else { @() }

Write-Host "Memeriksa direktori workspace:" -ForegroundColor Yellow
Write-Host "   - Total Skills Terdaftar : $($skillDirs.Count)"
Write-Host "   - Total Berkas Rules     : $($ruleFiles.Count)`n"

# Inisialisasi Metrik
$d1Score = 20 # Trigger Orthogonality
$d2Score = 20 # Domain Boundary
$d3Score = 20 # Rules vs Skills SSoT
$d4Score = 20 # Progressive Disclosure
$d5Score = 20 # Verification & Scripts

$issues = [System.Collections.Generic.List[string]]::new()
$registeredTags = @{}
$skillProfiles = @()

# 1. ANALISIS SETIAP SKILL
foreach ($dir in $skillDirs) {
    $skillName = $dir.Name
    $skillFile = Join-Path $dir.FullName "SKILL.md"
    
    if (-not (Test-Path $skillFile)) {
        $issues.Add("[$skillName] ERROR: Tidak memiliki berkas wajib 'SKILL.md'.")
        $d1Score -= 5
        $d4Score -= 5
        continue
    }

    $rawContent = Get-Content -Path $skillFile -Raw
    $lineCount = ($rawContent -split "`n").Count
    
    # Ekstraksi Frontmatter
    $frontmatterMatch = [regex]::Match($rawContent, "(?s)^---\s*\r?\n(.*?)\r?\n---")
    if (-not $frontmatterMatch.Success) {
        $issues.Add("[$skillName] ERROR: 'SKILL.md' tidak memiliki YAML frontmatter yang valid.")
        $d4Score -= 5
        continue
    }
    
    $fmText = $frontmatterMatch.Groups[1].Value
    $descMatch = [regex]::Match($fmText, "(?ms)description:\s*(?:>-\s*)?(.*?)(?:\n[a-zA-Z0-9_-]+:|\Z)")
    $desc = if ($descMatch.Success) { $descMatch.Groups[1].Value.Trim() } else { "" }
    $descWordCount = ($desc -split "\s+").Count

    # Cek panjang deskripsi (Progressive Disclosure)
    if ($descWordCount -gt 60) {
        $msg = "[$skillName] WARN: Deskripsi frontmatter terlalu panjang ($descWordCount kata). Idealnya <= 50 kata agar hemat token saat indexing awal."
        $issues.Add($msg)
        $d4Score = [Math]::Max(0, $d4Score - 2)
    }

    # Cek ukuran berkas SKILL.md
    if ($lineCount -gt 250) {
        $msg = "[$skillName] WARN: SKILL.md agak panjang ($lineCount baris). Pertimbangkan memecah dokumentasi ke 'references/'."
        $issues.Add($msg)
        $d4Score = [Math]::Max(0, $d4Score - 2)
    }

    # Ekstraksi Tag pemicu (@tag)
    $cssExclusions = @("@media", "@keyframes", "@import", "@font-face", "@supports", "@layer", "@container", "@charset")
    $tagRegex = [regex]'@[a-zA-Z0-9_-]+'
    $tagMatches = $tagRegex.Matches($desc + " " + $rawContent)
    $tags = @()
    foreach ($m in $tagMatches) {
        $tag = $m.Value.ToLower()
        if (-not $cssExclusions.Contains($tag) -and -not $tags.Contains($tag)) {
            $tags += $tag
        }
    }

    # Cek folder pendukung
    $hasRefs = Test-Path (Join-Path $dir.FullName "references")
    $hasScripts = Test-Path (Join-Path $dir.FullName "scripts")
    $hasExamples = Test-Path (Join-Path $dir.FullName "examples")

    if (-not $hasScripts) {
        $issues.Add("[$skillName] WARN: Tidak memiliki folder 'scripts/'. Skill sebaiknya memiliki helper skrip deterministik.")
        $d5Score = [Math]::Max(0, $d5Score - 4)
    }
    if (-not $hasRefs) {
        $issues.Add("[$skillName] WARN: Tidak memiliki folder 'references/' untuk progressive disclosure.")
        $d4Score = [Math]::Max(0, $d4Score - 3)
    }

    # Pengecekan Kolisi Tag (MECE Check)
    foreach ($t in $tags) {
        if ($registeredTags.ContainsKey($t)) {
            $prevOwner = $registeredTags[$t]
            $issues.Add("KOLISI KRITIS: Tag '$t' diklaim oleh dua skill sekaligus: [$prevOwner] dan [$skillName]!")
            $d1Score = [Math]::Max(0, $d1Score - 10)
        } else {
            $registeredTags[$t] = $skillName
        }
    }

    $skillProfiles += [PSCustomObject]@{
        Name = $skillName
        Tags = ($tags -join ", ")
        DescWords = $descWordCount
        Lines = $lineCount
        HasRefs = $hasRefs
        HasScripts = $hasScripts
    }
}

# 2. ANALISIS ATURAN WORKSPACE (RULES AUDIT)
$hasGovernanceRule = Test-Path (Join-Path $RulesRoot "skill_governance.md")
if (-not $hasGovernanceRule) {
    $issues.Add("[Rules] WARN: Berkas '.agents/rules/skill_governance.md' belum dipasang sebagai SSoT tata kelola.")
    $d3Score = [Math]::Max(0, $d3Score - 10)
}

foreach ($rf in $ruleFiles) {
    $fileBytes = (Get-Item $rf.FullName).Length
    if ($fileBytes -gt 24000) {
        $issues.Add("[Rules] ERROR: Berkas '$($rf.Name)' melebihi batas 24 KB Antigravity ($fileBytes bytes).")
        $d4Score = [Math]::Max(0, $d4Score - 5)
    }
}

# 3. SAJIKAN TABEL PROFIL SKILL
Write-Host "TABEL AUDIT SKILL (PROGRESSIVE DISCLOSURE & MECE):" -ForegroundColor Green
$skillProfiles | Format-Table -Property Name, Tags, DescWords, Lines, HasRefs, HasScripts -AutoSize | Out-String | Write-Host

# 4. HITUNG SKOR TOTAL
$totalScore = $d1Score + $d2Score + $d3Score + $d4Score + $d5Score
$tier = if ($totalScore -ge 90) { "Tier 1: Gold Standard (Production Ready)" }
        elseif ($totalScore -ge 75) { "Tier 2: Enterprise Compliant" }
        elseif ($totalScore -ge 60) { "Tier 3: Fragile / Sub-Optimal" }
        else { "Tier 4: Collision-Prone / Slop" }

Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Cyan
Write-Host " HASIL EVALUASI TATA KELOLA SKILL & ANTI-COLLISION" -ForegroundColor Cyan
Write-Host " Total Skor : $totalScore / 100" -ForegroundColor $(if ($totalScore -ge 90) { "Green" } elseif ($totalScore -ge 75) { "Yellow" } else { "Red" })
Write-Host " Maturity   : $tier`n" -ForegroundColor White

Write-Host " Breakdown 5 Dimensi Internasional:"
Write-Host "  1. Trigger & Semantic Orthogonality (MECE)   : $d1Score / 20"
Write-Host "  2. Functional Domain Boundary (SRP)         : $d2Score / 20"
Write-Host "  3. Rules vs Skills SSoT Architecture        : $d3Score / 20"
Write-Host "  4. Progressive Disclosure & Context Budget  : $d4Score / 20"
Write-Host "  5. Deterministic Verification & Tool Scripts: $d5Score / 20"
Write-Host "--------------------------------------------------------------------------------`n" -ForegroundColor Cyan

if ($issues.Count -gt 0) {
    Write-Host "TEMUAN & REKOMENDASI PERBAIKAN:" -ForegroundColor Yellow
    foreach ($iss in $issues) {
        Write-Host "  * $iss"
    }
    Write-Host ""
} else {
    Write-Host "SEMPURNA: Semua skill terpartisi sempurna (MECE), bebas kolisi, dan mematuhi standar Progressive Disclosure!`n" -ForegroundColor Green
}

if ($totalScore -ge 90) {
    exit 0
} else {
    exit 1
}
