$ErrorActionPreference = "Stop"

Write-Host "=== VENTRA — GATE 015A / STEP 5N-D VALIDATION ===" -ForegroundColor Cyan
Write-Host "Repo: $((Get-Location).Path)"
Write-Host ""

$decision = "docs/03_database/BOOKING_EXACT_PHYSICAL_CONTRACT_READINESS_DECISION_001.md"

if (Test-Path $decision) {
    Write-Host "[PASS] 5N-D decision document exists" -ForegroundColor Green
} else {
    Write-Host "[HOLD] 5N-D decision document NOT FOUND" -ForegroundColor Yellow
}

$sqlFiles = Get-ChildItem "docs/03_database/sql" -Recurse -Filter "*.sql" -File

$bookingCreate = @(
    $sqlFiles | Select-String -Pattern '(?i)CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?booking\s*\('
)

if ($bookingCreate.Count -eq 0) {
    Write-Host "[PASS] No CREATE TABLE booking found" -ForegroundColor Green
} else {
    Write-Host "[HOLD] CREATE TABLE booking FOUND" -ForegroundColor Yellow
    $bookingCreate | ForEach-Object {
        Write-Host "       $($_.Path):$($_.LineNumber)"
    }
}

$bookingMigration = @(
    $sqlFiles | Where-Object { $_.Name -match "(?i)booking" }
)

if ($bookingMigration.Count -eq 0) {
    Write-Host "[PASS] No Booking migration found" -ForegroundColor Green
} else {
    Write-Host "[INFO] Booking-related SQL files:"
    $bookingMigration | ForEach-Object {
        Write-Host "       $($_.Name)"
    }
}

Write-Host ""
Write-Host "=== PHYSICAL SQL INVENTORY ===" -ForegroundColor Cyan

$sqlFiles | ForEach-Object {
    Write-Host "- $($_.FullName)"
}

Write-Host ""
Write-Host "=== BOOKING PHYSICAL AUTHORITY ===" -ForegroundColor Cyan

if ($bookingCreate.Count -eq 0) {
    Write-Host "[HOLD] Parent Booking table not physically established" -ForegroundColor Yellow
    Write-Host "[HOLD] Booking PK not physically established" -ForegroundColor Yellow
    Write-Host "[HOLD] Booking tenant_id not physically established" -ForegroundColor Yellow
    Write-Host "[HOLD] Booking FK contract not physically established" -ForegroundColor Yellow
} else {
    Write-Host "[REVIEW] Booking table exists; physical contract requires detailed validation" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== GIT STATUS ===" -ForegroundColor Cyan

git status --short

Write-Host ""
Write-Host "=== RESULT ===" -ForegroundColor Cyan
Write-Host "Booking Physical Contract Readiness : HOLD" -ForegroundColor Yellow
Write-Host "Booking Migration Readiness         : HOLD" -ForegroundColor Yellow
Write-Host "Gate 015A                           : HOLD" -ForegroundColor Yellow

Write-Host ""
Write-Host "READ-ONLY VALIDATION."
Write-Host "No database or migration was modified."
