# Auther: dreamscaperia
# Version: 1.0
# Title: Subtitle Aligner
# Desc: Automatically rename the ass/srt files to align with the mkv files' name.
$count = 0
$length = 0

function rename-BBSubtitle{
    param(
        $length,
        $suffix
    )
    $result = $false
    for($i = $length; $i -gt 0; $i--){
        $temp = Get-ChildItem -File ($_.BaseName.subString(0, $i)+"*."+$suffix)
        $result = ($temp|Measure-Object).Count -eq 1
        if($result){Rename-Item -LiteralPath $temp -NewName ($_.BaseName+"."+$suffix)}
        if($result){break}
    }
    Write-Output $result
}

$changed = $false
Get-ChildItem *.mkv|%{
    $length = $_.baseName.length
    $changed = $changed -or (rename-BBSubtitle -length $length -suffix "ass")
    $changed = $changed -or (rename-BBSubtitle -length $length -suffix "srt")
}
if($changed){
    echo "Found and touched."
} else {
    echo "Found nothing and touched none."
}