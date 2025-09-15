function New-PSJNote {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Body,
        [string] $Topic = $null,
        [Priority] $Priority = [Priority]::Low
    )
    $jrnlParams = @{
        Body = $Body
    }
    if ($null -ne $Topic) { $jrnlParams['Topic'] = $Topic }
    $jrnlParams['Priority'] = $Priority
    $NoteJrnl = [Jrnl]::new($jrnlParams)
    $jrnlParams
    Out-PSJournalDataToFile -Note $NoteJrnl
    return $NoteJrnl
}
