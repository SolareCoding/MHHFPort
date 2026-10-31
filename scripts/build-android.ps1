param([string]$SdkPath = "$env:LOCALAPPDATA/Android/Sdk")
$ErrorActionPreference = 'Stop'
Push-Location (Join-Path $PSScriptRoot '..')
try {
    if (!(Test-Path "$SdkPath/platforms/android-35/android.jar")) { throw 'Install Android SDK platform 35 first.' }
    node scripts/prepare-android.mjs
    if ($LASTEXITCODE) { throw 'Asset preparation failed.' }
    [IO.File]::WriteAllText((Join-Path (Get-Location) 'android/local.properties'), 'sdk.dir=' + $SdkPath.Replace('\','/') + "`n")
    & ./android/gradlew.bat -p android assembleDebug --console=plain
    if ($LASTEXITCODE) { throw 'Android build failed.' }
    New-Item artifacts -ItemType Directory -Force | Out-Null
    Copy-Item android/app/build/outputs/apk/debug/app-debug.apk artifacts/MHHFPort-0.3.0-debug.apk
    Get-FileHash artifacts/MHHFPort-0.3.0-debug.apk -Algorithm SHA256
} finally { Pop-Location }
