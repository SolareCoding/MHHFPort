$ErrorActionPreference = 'Stop'
$taskSources = @(
    @{ File='lingdong-hiphop-original.swf'; Page='https://www.mhhf.com/game/play/208'; Url='https://www.mhhf.com/files/game/208/25b.swf'; Label='原版' },
    @{ File='lingdong-hiphop-integrated.swf'; Page='https://www.mhhf.com/game/play/210'; Url='https://www.mhhf.com/files/game/210/a5b.swf'; Label='集成版' }
)
$taskResults = foreach ($taskSource in $taskSources) {
    $taskPath = Join-Path $PSScriptRoot $taskSource.File
    $taskBytes = [IO.File]::ReadAllBytes($taskPath)
    $taskSignature = [Text.Encoding]::ASCII.GetString($taskBytes,0,3)
    if ($taskSignature -ne 'CWS') { throw "Unexpected signature: $taskSignature" }
    $taskInput = [IO.MemoryStream]::new($taskBytes,8,$taskBytes.Length-8)
    $taskInflater = [IO.Compression.ZLibStream]::new($taskInput,[IO.Compression.CompressionMode]::Decompress)
    $taskOutput = [IO.MemoryStream]::new()
    try { $taskInflater.CopyTo($taskOutput); $taskBody = $taskOutput.ToArray() }
    finally { $taskInflater.Dispose(); $taskInput.Dispose(); $taskOutput.Dispose() }
    $taskDeclared = [BitConverter]::ToUInt32($taskBytes,4)
    if ($taskBody.Length + 8 -ne $taskDeclared) { throw 'Decompressed length mismatch' }
    $taskRectBits = $taskBody[0] -shr 3
    $taskRectLength = [int][Math]::Ceiling((5 + 4*$taskRectBits)/8.0)
    $taskFrameRate = [BitConverter]::ToUInt16($taskBody,$taskRectLength)/256.0
    $taskFrameCount = [BitConverter]::ToUInt16($taskBody,$taskRectLength+2)
    $taskPos = $taskRectLength + 4
    $taskCounts = @{}
    $taskEnd = $false
    while ($taskPos + 2 -le $taskBody.Length) {
        $taskTag = [BitConverter]::ToUInt16($taskBody,$taskPos); $taskPos += 2
        $taskCode = [int]($taskTag -shr 6); $taskLength = [long]($taskTag -band 63)
        if ($taskLength -eq 63) {
            if ($taskPos + 4 -gt $taskBody.Length) { throw 'Truncated tag length' }
            $taskLength = [BitConverter]::ToUInt32($taskBody,$taskPos); $taskPos += 4
        }
        if ($taskPos + $taskLength -gt $taskBody.Length) { throw 'Truncated tag body' }
        if (-not $taskCounts.ContainsKey($taskCode)) { $taskCounts[$taskCode] = 0 }
        $taskCounts[$taskCode]++
        $taskPos += $taskLength
        if ($taskCode -eq 0) { $taskEnd = $true; break }
    }
    if (-not $taskEnd) { throw 'No top-level End tag' }
    [pscustomobject]@{
        label=$taskSource.Label; file=$taskSource.File; source_page=$taskSource.Page; download_url=$taskSource.Url
        bytes=$taskBytes.Length; sha256=(Get-FileHash -LiteralPath $taskPath -Algorithm SHA256).Hash
        signature=$taskSignature; swf_version=$taskBytes[3]; uncompressed_bytes=$taskDeclared
        decompression_length_verified=$true; top_level_tags_valid=$true; end_tag_found=$taskEnd
        frame_rate=$taskFrameRate; root_timeline_frames=$taskFrameCount
        avm='AVM1 (SWF version 7/8; exact AS1 versus AS2 source syntax not determined)'
        top_level_do_action_tags=[int]$taskCounts[12]; top_level_do_init_action_tags=[int]$taskCounts[59]
        top_level_do_abc_tags=[int]$taskCounts[82]
        dependency_status='Not fully analyzed; offline play and external dependency completeness unverified'
    }
}
$taskManifest = [pscustomobject]@{collected_date='2026-10-30';files=@($taskResults);verification='Static parsing only; game not executed'}
$taskManifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $PSScriptRoot 'manifest.json') -Encoding utf8
$taskManifest | ConvertTo-Json -Depth 8
