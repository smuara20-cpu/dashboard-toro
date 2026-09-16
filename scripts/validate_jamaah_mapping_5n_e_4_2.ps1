$ErrorActionPreference = "Stop"

Write-Host "=== VENTRA — GATE 015A / STEP 5N-E.4.2 ===" -ForegroundColor Cyan
Write-Host "JAMAAH POSTGRESQL MAPPING DECISION VALIDATION"
Write-Host ""

$decision = "docs/03_database/JAMAAH_POSTGRESQL_MAPPING_DECISION_001.md"

# 1. Decision document
if (Test-Path $decision) {
    Write-Host "[PASS] Jamaah PostgreSQL Mapping Decision exists" -ForegroundColor Green
} else {
    Write-Host "[HOLD] Decision document NOT FOUND" -ForegroundColor Yellow
}

# 2. Check status
if (Test-Path $decision) {
    $content = Get-Content $decision -Raw

    if ($content -match "Status:\s*HOLD\s*/\s*MAPPING DECISION") {
        Write-Host "[PASS] Decision status = HOLD / MAPPING DECISION" -ForegroundColor Green
    } else {
        Write-Host "[REVIEW] Decision status marker not found" -ForegroundColor Yellow
    }

    if ($content -match "NO SQL AUTHORIZATION") {
        Write-Host "[PASS] SQL authorization explicitly blocked" -ForegroundColor Green
    } else {
        Write-Host "[HOLD] SQL authorization block not found" -ForegroundColor Yellow
    }
}

# 3. Physical SQL inventory
Write-Host ""
Write-Host "=== PHYSICAL SQL INVENTORY ===" -ForegroundColor Cyan

$sqlFiles = Get-ChildItem "docs/03_database/sql" -Recurse -Filter "*.sql" -File

$sqlFiles | ForEach-Object {
    Write-Host "- $($_.FullName)"
}

# 4. Check Jamaah CREATE TABLE
Write-Host ""
Write-Host "=== JAMAah PHYSICAL SQL CHECK ===" -ForegroundColor Cyan

$jamaahCreate = @(
    $sqlFiles |
    Select-String -Pattern '(?i)CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?jamaah\s*\('
)

if ($jamaahCreate.Count -eq 0) {
    Write-Host "[PASS] No CREATE TABLE jamaah found" -ForegroundColor Green
} else {
    Write-Host "[HOLD] CREATE TABLE jamaah FOUND" -ForegroundColor Yellow
    $jamaahCreate | ForEach-Object {
        Write-Host "       $($_.Path):$($_.LineNumber)"
    }
}

# 5. Check Jamaah migration
$jamaahMigration = @(
    $sqlFiles | Where-Object {
        $_.Name -match "(?i)jamaah"
    }
)

if ($jamaahMigration.Count -eq 0) {
    Write-Host "[PASS] No Jamaah migration found" -ForegroundColor Green
} else {
    Write-Host "[INFO] Jamaah-related SQL files:"
    $jamaahMigration | ForEach-Object {
        Write-Host "       $($_.Name)"
    }
}

# 6. Check existing booking_passenger dependency
Write-Host ""
Write-Host "=== BOOKING_PASSENGER DEPENDENCY ===" -ForegroundColor Cyan

$bpFiles = @(
    $sqlFiles | Where-Object {
        $_.Name -match "(?i)booking_passenger"
    }
)

if ($bpFiles.Count -gt 0) {
    $jamaahReference = @(
        $bpFiles | Select-String -Pattern '(?i)REFERENCES\s+jamaah\s*\(\s*id\s*\)'
    )

    if ($jamaahReference.Count -gt 0) {
        Write-Host "[PASS] booking_passenger → jamaah(id) reference exists" -ForegroundColor Green
    } else {
        Write-Host "[REVIEW] Jamaah reference not found in booking_passenger" -ForegroundColor Yellow
    }
} else {
    Write-Host "[HOLD] booking_passenger SQL not found" -ForegroundColor Yellow
}

# 7. Check forbidden physical changes
Write-Host ""
Write-Host "=== SQL AUTHORIZATION CHECK ===" -ForegroundColor Cyan

if ($jamaahCreate.Count -eq 0 -and $jamaahMigration.Count -eq 0) {
    Write-Host "[PASS] No Jamaah physical SQL introduced" -ForegroundColor Green
} else {
    Write-Host "[HOLD] Jamaah physical SQL detected; requires controlled review" -ForegroundColor Yellow
}

# 8. Git status
Write-Host ""
Write-Host "=== GIT STATUS ===" -ForegroundColor Cyan

git status --short

# 9. Final result
Write-Host ""
Write-Host "=== RESULT ===" -ForegroundColor Cyan

Write-Host "Jamaah Logical Authority              : GREEN"
Write-Host "Jamaah PostgreSQL Mapping Decision   : HOLD"
Write-Host "Jamaah SQL Authorization              : NOT AUTHORIZED"
Write-Host "Gate 015A / Step 5N-E.4.2            : CLOSED AS HOLD" -ForegroundColor Yellow

Write-Host ""
Write-Host "READ-ONLY VALIDATION."
Write-Host "No database or migration was modified."
