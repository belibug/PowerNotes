function Get-PSJournalFile {
    param (
        [int] $Year = (Get-Date).Year
    )
    $baseDir = Get-PSJournalDir
    $fileName = "journal-$Year.json"
    return Join-Path $baseDir $fileName
}