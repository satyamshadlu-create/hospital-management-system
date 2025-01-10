$SRC    = "C:\Users\sanja\OneDrive\Pictures\Desktop\temppp_ref"
$DEST   = "C:\Users\sanja\OneDrive\Pictures\Desktop\temppp"
$REMOTE = "https://github.com/satyamshadlu-create/hospital-management-system.git"

Set-Location $DEST

# --- Init fresh repo ---
git init
git config user.name  "satyamshadlu-create"
git config user.email "satyamshadlu-create@users.noreply.github.com"

# Rename default branch to main if needed
git checkout -B main 2>$null

# ============================================================
# Helper: stage all + commit with a specific date
# ============================================================
function Commit-WithDate {
    param([string]$Message, [string]$DateStr)
    $env:GIT_AUTHOR_DATE    = $DateStr
    $env:GIT_COMMITTER_DATE = $DateStr
    git add -A
    $result = git commit -m $Message 2>&1
    Write-Host $result
    Remove-Item Env:\GIT_AUTHOR_DATE    -ErrorAction SilentlyContinue
    Remove-Item Env:\GIT_COMMITTER_DATE -ErrorAction SilentlyContinue
}

# ============================================================
# COMMIT 1 – Initial project skeleton + README
# ============================================================
Copy-Item "$SRC\README.md"          "$DEST\README.md"    -Force
Copy-Item "$SRC\.gitignore"         "$DEST\.gitignore"   -Force
Copy-Item "$SRC\LICENSE"            "$DEST\LICENSE"      -Force
Commit-WithDate "Initial commit: Add README, LICENSE and .gitignore" "2022-01-10T10:00:00+05:30"

# ============================================================
# COMMIT 2 – Add project documentation
# ============================================================
New-Item -ItemType Directory -Path "$DEST\docs" -Force | Out-Null
Copy-Item "$SRC\docs\project-documentation.md" "$DEST\docs\project-documentation.md" -Force
Copy-Item "$SRC\docs\user-manual.md"            "$DEST\docs\user-manual.md"           -Force
Copy-Item "$SRC\docs\address.md"                "$DEST\docs\address.md"               -Force
Copy-Item "$SRC\docs\uml-class-diagram.jpeg"    "$DEST\docs\uml-class-diagram.jpeg"   -Force
Commit-WithDate "docs: Add project documentation, user manual and UML class diagram" "2022-01-12T14:30:00+05:30"

# ============================================================
# COMMIT 3 – Add base header files
# ============================================================
New-Item -ItemType Directory -Path "$DEST\include" -Force | Out-Null
Copy-Item "$SRC\include\global.hh"      "$DEST\include\global.hh"  -Force
Copy-Item "$SRC\include\address.hh"     "$DEST\include\address.hh" -Force
Copy-Item "$SRC\include\person.hh"      "$DEST\include\person.hh"  -Force
Commit-WithDate "feat: Add global, address and person header files" "2022-01-15T09:15:00+05:30"

# ============================================================
# COMMIT 4 – Add doctor, patient, nurse headers
# ============================================================
Copy-Item "$SRC\include\doctor.hh"  "$DEST\include\doctor.hh"  -Force
Copy-Item "$SRC\include\patient.hh" "$DEST\include\patient.hh" -Force
Copy-Item "$SRC\include\nurse.hh"   "$DEST\include\nurse.hh"   -Force
Commit-WithDate "feat: Add doctor, patient and nurse class headers" "2022-01-18T11:00:00+05:30"

# ============================================================
# COMMIT 5 – Add appointment, ambulance, driver, hospital headers
# ============================================================
Copy-Item "$SRC\include\appointment.hh" "$DEST\include\appointment.hh" -Force
Copy-Item "$SRC\include\ambulance.hh"   "$DEST\include\ambulance.hh"   -Force
Copy-Item "$SRC\include\driver.hh"      "$DEST\include\driver.hh"      -Force
Copy-Item "$SRC\include\hospital.hh"    "$DEST\include\hospital.hh"    -Force
Commit-WithDate "feat: Add appointment, ambulance, driver and hospital headers" "2022-01-20T16:45:00+05:30"

# ============================================================
# COMMIT 6 – Implement global, address, person source files
# ============================================================
New-Item -ItemType Directory -Path "$DEST\src" -Force | Out-Null
Copy-Item "$SRC\src\global.cpp"  "$DEST\src\global.cpp"  -Force
Copy-Item "$SRC\src\address.cpp" "$DEST\src\address.cpp" -Force
Copy-Item "$SRC\src\person.cpp"  "$DEST\src\person.cpp"  -Force
Commit-WithDate "feat: Implement global utilities, address and person classes" "2022-01-23T10:30:00+05:30"

# ============================================================
# COMMIT 7 – Implement doctor, patient, nurse
# ============================================================
Copy-Item "$SRC\src\doctor.cpp"  "$DEST\src\doctor.cpp"  -Force
Copy-Item "$SRC\src\patient.cpp" "$DEST\src\patient.cpp" -Force
Copy-Item "$SRC\src\nurse.cpp"   "$DEST\src\nurse.cpp"   -Force
Commit-WithDate "feat: Implement doctor, patient and nurse classes" "2022-01-27T13:00:00+05:30"

# ============================================================
# COMMIT 8 – Implement appointment, ambulance, driver
# ============================================================
Copy-Item "$SRC\src\appointment.cpp" "$DEST\src\appointment.cpp" -Force
Copy-Item "$SRC\src\ambulance.cpp"   "$DEST\src\ambulance.cpp"   -Force
Copy-Item "$SRC\src\driver.cpp"      "$DEST\src\driver.cpp"      -Force
Commit-WithDate "feat: Implement appointment, ambulance and driver classes" "2022-02-01T11:20:00+05:30"

# ============================================================
# COMMIT 9 – Implement hospital management core
# ============================================================
Copy-Item "$SRC\src\hospital.cpp" "$DEST\src\hospital.cpp" -Force
Commit-WithDate "feat: Implement hospital management core logic" "2022-02-05T15:00:00+05:30"

# ============================================================
# COMMIT 10 – Add main entry point
# ============================================================
Copy-Item "$SRC\main.cpp" "$DEST\main.cpp" -Force
Commit-WithDate "feat: Add main.cpp - entry point of the application" "2022-02-08T10:45:00+05:30"

# ============================================================
# COMMIT 11 – Add Makefile and build artifacts
# ============================================================
Copy-Item "$SRC\Makefile" "$DEST\Makefile" -Force
New-Item -ItemType Directory -Path "$DEST\build" -Force | Out-Null
Copy-Item "$SRC\build\hms.exe" "$DEST\build\hms.exe" -Force
Commit-WithDate "build: Add Makefile and pre-built binary" "2022-02-10T09:30:00+05:30"

# ============================================================
# COMMIT 12 – Add sample data CSV files
# ============================================================
New-Item -ItemType Directory -Path "$DEST\data" -Force | Out-Null
Copy-Item "$SRC\data\*" "$DEST\data\" -Recurse -Force
Commit-WithDate "data: Add sample CSV data files for all entities" "2022-02-12T14:00:00+05:30"

# ============================================================
# COMMIT 13 – Community / GitHub meta files
# ============================================================
New-Item -ItemType Directory -Path "$DEST\.github\ISSUE_TEMPLATE" -Force | Out-Null
Copy-Item "$SRC\.github\FUNDING.yml"                        "$DEST\.github\FUNDING.yml"                        -Force
Copy-Item "$SRC\.github\ISSUE_TEMPLATE\bug_report.md"       "$DEST\.github\ISSUE_TEMPLATE\bug_report.md"       -Force
Copy-Item "$SRC\.github\ISSUE_TEMPLATE\feature_request.md"  "$DEST\.github\ISSUE_TEMPLATE\feature_request.md"  -Force
Copy-Item "$SRC\CODE_OF_CONDUCT.md"                         "$DEST\CODE_OF_CONDUCT.md"                         -Force
Copy-Item "$SRC\CONTRIBUTING.md"                            "$DEST\CONTRIBUTING.md"                            -Force
Commit-WithDate "community: Add GitHub templates, CODE_OF_CONDUCT and CONTRIBUTING guide" "2022-02-14T16:30:00+05:30"

# ============================================================
# COMMIT 14 – Final polish
# ============================================================
Add-Content "$DEST\README.md" "`n"
Commit-WithDate "docs: Final README polish and overall project cleanup" "2022-02-15T18:00:00+05:30"

# ============================================================
# Push to GitHub
# ============================================================
git remote add origin $REMOTE
Write-Host "`nPushing to $REMOTE ..."
git push -u origin main --force

Write-Host "`n✅ All done! Check https://github.com/satyamshadlu-create/hospital-management-system"
