# Auther: dreamscaperia
# Version: 1.1
# Title: Subtitle Aligner
# Desc: Automatically rename the ass/srt files to align with the mkv files' name.
$count = 0
$length = 0

function rename-BBSubtitle{
    param(
        $plength,
        $suffix
    )
    $result = $false
    for($i = $plength; $i -gt 0; $i--){
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
    $changed = (rename-BBSubtitle -plength $length -suffix "ass")
    $changed = (rename-BBSubtitle -plength $length -suffix "srt") -or $changed
}
if($changed){
    echo "Found and touched."
} else {
    echo "Found nothing and touched none."
}