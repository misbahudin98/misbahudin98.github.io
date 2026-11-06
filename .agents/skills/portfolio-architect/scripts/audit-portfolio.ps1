<#
.SYNOPSIS
    Automated International-Grade Portfolio Auditor (ATS, HRD, GSAP, A11Y).
.DESCRIPTION
    Scans index.html or target portfolio HTML against the 5 International Dimensions
    and enforces invariants defined in .agents/rules/portfolio_invariants.md.
.PARAMETER Path
    Path to the index.html file to audit (defaults to .\index.html).
.EXAMPLE
    .\.agents\skills\portfolio-architect\scripts\audit-portfolio.ps1
#>

[CmdletBinding()]
param (
    [string]$Path = "index.html"
)

# Set UTF-8 Output Encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host "  INTERNATIONAL DEVELOPER PORTFOLIO AUDITOR v2.0" -ForegroundColor Cyan
Write-Host "  Standard: ATS Schema, HRD 6s Scan, GSAP Compositor, WCAG 2.2" -ForegroundColor DarkCyan
Write-Host "==================================================================" -ForegroundColor Cyan

if (-not (Test-Path -Path $Path)) {
    Write-Host "[FATAL ERROR] File target '$Path' tidak ditemukan!" -ForegroundColor Red
    exit 1
}

$content = Get-Content -Path $Path -Raw -Encoding UTF8

$scoreATS = 0
$maxATS = 20
$scoreHRD = 0
$maxHRD = 25
$scoreProof = 0
$maxProof = 20
$scoreGSAP = 0
$maxGSAP = 20
$scoreA11Y = 0
$maxA11Y = 15

$findings = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

# ==========================================================
# 1. ATS MACHINE READABILITY (20 PTS)
# ==========================================================
Write-Host "`n[1/5] Memeriksa ATS Machine Readability..." -ForegroundColor Yellow

# A. JSON-LD Schema.org Check
if ($content -match '<script\s+type=["'']application/ld\+json["'']>([\s\S]*?)<\/script>') {
    $jsonContent = $matches[1]
    if ($jsonContent -match '"@type"\s*:\s*"Person"') {
        $scoreATS += 6
        $findings.Add("[PASS] Schema.org '@type: Person' ditemukan.")
    } else {
        $warnings.Add("[WARN] Schema.org JSON-LD ditemukan tetapi tidak bertipe 'Person'.")
    }

    if ($jsonContent -match '"jobTitle"') {
        $scoreATS += 4
        $findings.Add("[PASS] Schema.org properti 'jobTitle' ditemukan.")
    } else {
        $warnings.Add("[WARN] Schema.org tidak memiliki properti 'jobTitle'.")
    }

    if ($jsonContent -match '"knowsAbout"') {
        $scoreATS += 3
        $findings.Add("[PASS] Schema.org entitas 'knowsAbout' ditemukan untuk ATS keyword extraction.")
    }

    if ($jsonContent -match '"sameAs"') {
        $scoreATS += 3
        $findings.Add("[PASS] Schema.org 'sameAs' profile links (GitHub/LinkedIn) terverifikasi.")
    }
} else {
    $warnings.Add("[FAIL] Tag JSON-LD Schema.org tidak ditemukan di dalam HTML!")
}

# B. Semantic HTML & Heading Hierarchy
$h1Count = ([regex]::Matches($content, '<h1[\s>]')).Count
if ($h1Count -eq 1) {
    $scoreATS += 2
    $findings.Add("[PASS] Struktur Heading: Tepat satu <h1> utama ditemukan.")
} elseif ($h1Count -gt 1) {
    $warnings.Add("[WARN] Ditemukan $h1Count tag <h1>. Direkomendasikan hanya 1 <h1> utama untuk SEO/ATS.")
    $scoreATS += 1
} else {
    $warnings.Add("[FAIL] Tidak ditemukan tag <h1> di dokumen.")
}

if ($content -match '<header[\s>]' -and $content -match '<footer[\s>]' -and $content -match '<section[\s>]') {
    $scoreATS += 2
    $findings.Add("[PASS] Struktur Semantic HTML5 (<header>, <section>, <footer>) valid.")
}

# ==========================================================
# 2. HRD COGNITIVE 6-SECOND SCAN (25 PTS)
# ==========================================================
Write-Host "[2/5] Memeriksa HRD 6-Second Scan & Above-the-fold..." -ForegroundColor Yellow

# A. Above-the-fold CTA (Resume / CV)
if ($content -match 'href=["''][^"'']*(?:resume|cv|\.pdf)["'']' -or $content -match '(?:unduh|download)\s*(?:cv|resume)' -or $content -match 'window\.print\(\)') {
    $scoreHRD += 8
    $findings.Add("[PASS] CTA Resume/CV (Download / Print) tersedia untuk recruiter.")
} else {
    $warnings.Add("[WARN] Tombol CTA Resume/CV tidak terdeteksi jelas di HTML.")
}

# B. Status Ketersediaan (Availability Badge)
if ($content -match '(?i)(?:available for hire|open to work|siap kerja|status ketersediaan)') {
    $scoreHRD += 6
    $findings.Add("[PASS] Live Availability Badge ('Available for Hire') ditemukan di hero.")
} else {
    $warnings.Add("[WARN] Tidak ditemukan badge status ketersediaan kerja di area hero.")
}

# C. Kontak Langsung (Direct Contact Channels)
$hasEmail = ($content -match 'mailto:')
$hasTel = ($content -match 'tel:' -or $content -match 'wa\.me' -or $content -match 'whatsapp')
$hasLinkedIn = ($content -match 'linkedin\.com')

if ($hasEmail -and ($hasTel -or $hasLinkedIn)) {
    $scoreHRD += 6
    $findings.Add("[PASS] Saluran kontak langsung (Email + LinkedIn/WhatsApp) lengkap.")
} elseif ($hasEmail -or $hasLinkedIn) {
    $scoreHRD += 4
    $warnings.Add("[WARN] Kontak langsung parsial (hanya salah satu dari Email/LinkedIn).")
} else {
    $warnings.Add("[FAIL] Tautan kontak langsung (mailto/LinkedIn) tidak ditemukan.")
}

# D. Zero Splash / No Long Loader
if ($content -match 'id=["'']loader["'']' -or $content -match 'class=["''][^"'']*preloader[^"'']*["'']') {
    $warnings.Add("[WARN] Terdeteksi potensi preloader element. Pastikan tidak memblokir FCP > 0.5s.")
    $scoreHRD += 3
} else {
    $scoreHRD += 5
    $findings.Add("[PASS] Zero Splash Screen: Konten langsung dapat diakses instan (FCP optimal).")
}

# ==========================================================
# 3. PROOF OF WORK & CASE STUDY DEPTH (20 PTS)
# ==========================================================
Write-Host "[3/5] Memeriksa Bukti Hasil Kerja (Proof of Work)..." -ForegroundColor Yellow

# A. Tautan Proyek Nyata (Live Demo & Source Code)
$hasLiveDemo = ($content -match 'href=["'']https?:\/\/[^"'']+["''][^>]*>(?:[\s\S]*?)(?:Live Demo|Lihat Demo|Kunjungi|Live Preview)')
$hasGitHubLinks = ($content -match 'github\.com\/[a-zA-Z0-9_\-\/]+')

if ($hasLiveDemo) {
    $scoreProof += 7
    $findings.Add("[PASS] Tombol/Tautan Live Demo terverifikasi pada proyek.")
} else {
    $warnings.Add("[WARN] Tautan 'Live Demo' tidak terdeteksi pada daftar proyek.")
}

if ($hasGitHubLinks) {
    $scoreProof += 7
    $findings.Add("[PASS] Tautan Source Code / GitHub terverifikasi pada proyek.")
} else {
    $warnings.Add("[WARN] Tautan GitHub repositori tidak ditemukan pada proyek.")
}

# B. Metrik Kuantitatif Terukur (STAR / Google XYZ numbers)
if ($content -match '\d+[\.,]\d+\+?' -or $content -match '\d{2,}\%') {
    $scoreProof += 6
    $findings.Add("[PASS] Metrik dampak terukur (angka numerik / persentase) ditemukan.")
} else {
    $warnings.Add("[WARN] Deskripsi proyek kurang memuat metrik hasil kuantitatif.")
}

# ==========================================================
# 4. GSAP MOTION & COMPOSITOR PERFORMANCE (20 PTS)
# ==========================================================
Write-Host "[4/5] Memeriksa GSAP Motion & Compositor Performance..." -ForegroundColor Yellow

# A. GSAP Integration
if ($content -match 'gsap(?:\.min)?\.js') {
    $scoreGSAP += 6
    $findings.Add("[PASS] GSAP Library resmi terintegrasi.")
} else {
    $warnings.Add("[FAIL] Pustaka GSAP tidak ditemukan di dokumen!")
}

# B. ScrollTrigger Integration
if ($content -match 'ScrollTrigger(?:\.min)?\.js') {
    $scoreGSAP += 4
    $findings.Add("[PASS] GSAP ScrollTrigger plugin terintegrasi.")
}

# C. Anti-Pattern Layout Thrashing Check
# Cek apakah ada animasi gsap yang mengutak-atik top, left, width, height langsung
$hasLayoutThrashing = ($content -match 'gsap\.(?:to|from|fromTo)\([^)]*\{\s*[^}]*\b(?:top|left|right|bottom|width|height|margin)\s*:')
if (-not $hasLayoutThrashing) {
    $scoreGSAP += 6
    $findings.Add("[PASS] Zero Layout Thrashing: Animasi berfokus pada properti GPU (transform/opacity).")
} else {
    $warnings.Add("[WARN] Terdeteksi manipulasi properti layout (top/left/width/height) di GSAP.")
    $scoreGSAP += 2
}

# D. Smooth Micro-interactions
if ($content -match 'spotlight-card' -or $content -match 'magnetic-btn' -or $content -match 'stagger') {
    $scoreGSAP += 4
    $findings.Add("[PASS] Micro-interactions (spotlight/magnetic/stagger) terpasang rapi.")
}

# ==========================================================
# 5. ACCESSIBILITY (WCAG 2.2) & PRINT CSS (15 PTS)
# ==========================================================
Write-Host "[5/5] Memeriksa Aksesibilitas (WCAG 2.2) & Print CSS..." -ForegroundColor Yellow

# A. Print Stylesheet (@media print)
if ($content -match '@media\s+print') {
    $scoreA11Y += 6
    $findings.Add("[PASS] '@media print' stylesheet terintegrasi untuk ekspor CV bersih.")
    
    if ($content -match 'break-inside\s*:\s*avoid' -or $content -match 'page-break-inside') {
        $scoreA11Y += 2
        $findings.Add("[PASS] Print pagination guard ('break-inside: avoid') terkonfigurasi.")
    }
} else {
    $warnings.Add("[WARN] CSS '@media print' tidak ditemukan. Ekspor PDF mungkin berantakan.")
}

# B. Prefers-Reduced-Motion Check
if ($content -match 'prefers-reduced-motion') {
    $scoreA11Y += 7
    $findings.Add("[PASS] Mendukung standar W3C 'prefers-reduced-motion'.")
} else {
    $warnings.Add("[WARN] Tidak ditemukan penanganan 'prefers-reduced-motion' untuk kenyamanan pengguna sensitif gerak.")
    $scoreA11Y += 2
}

# ==========================================================
# TOTAL SCORE CALCULATION & REPORT
# ==========================================================
$totalScore = $scoreATS + $scoreHRD + $scoreProof + $scoreGSAP + $scoreA11Y

Write-Host "`n==================================================================" -ForegroundColor Cyan
Write-Host "                  HASIL AUDIT PORTOFOLIO" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan

Write-Host "1. ATS Machine Readability : $scoreATS / $maxATS" -ForegroundColor $(if ($scoreATS -ge 16) { "Green" } else { "Yellow" })
Write-Host "2. HRD 6-Second Scan UX   : $scoreHRD / $maxHRD" -ForegroundColor $(if ($scoreHRD -ge 20) { "Green" } else { "Yellow" })
Write-Host "3. Proof of Work Depth    : $scoreProof / $maxProof" -ForegroundColor $(if ($scoreProof -ge 16) { "Green" } else { "Yellow" })
Write-Host "4. GSAP Motion Compositor : $scoreGSAP / $maxGSAP" -ForegroundColor $(if ($scoreGSAP -ge 16) { "Green" } else { "Yellow" })
Write-Host "5. Accessibility & Print  : $scoreA11Y / $maxA11Y" -ForegroundColor $(if ($scoreA11Y -ge 12) { "Green" } else { "Yellow" })

Write-Host "------------------------------------------------------------------" -ForegroundColor DarkGray

$tier = ""
$tierColor = [ConsoleColor]::White
if ($totalScore -ge 88) {
    $tier = "TIER 1 (Elite World-Class Developer Portfolio)"
    $tierColor = [ConsoleColor]::Green
} elseif ($totalScore -ge 75) {
    $tier = "TIER 2 (Solid Professional Portfolio)"
    $tierColor = [ConsoleColor]::Cyan
} elseif ($totalScore -ge 60) {
    $tier = "TIER 3 (Candidate At Risk - Perlu Perbaikan)"
    $tierColor = [ConsoleColor]::Yellow
} else {
    $tier = "TIER 4 (Unusable / Slop - Wajib Dirombak)"
    $tierColor = [ConsoleColor]::Red
}

Write-Host "SKOR AKHIR : $totalScore / 100" -ForegroundColor $tierColor
Write-Host "PREDIKAT   : $tier`n" -ForegroundColor $tierColor

Write-Host "--- RINGKASAN TEMUAN POSITIF ---" -ForegroundColor Green
foreach ($f in $findings) {
    Write-Host " $f" -ForegroundColor Green
}

if ($warnings.Count -gt 0) {
    Write-Host "`n--- CATATAN PERBAIKAN (ACTION ITEMS) ---" -ForegroundColor Yellow
    foreach ($w in $warnings) {
        Write-Host " $w" -ForegroundColor Yellow
    }
}

Write-Host "`n==================================================================" -ForegroundColor Cyan

return $totalScore
