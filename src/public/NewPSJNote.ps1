function New-PSJNote {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Body,
        [string] $Topic = $null,
        [priority]$Priority = [priority]::Low
    )
    $jrnlParams = @{
        Body = $Body
    }
    if ($null -ne $Topic) { $jrnlParams['Topic'] = $Topic }
    $jrnlParams['Priority'] = $Priority
    $NoteJrnl = [Jrnl]::new($jrnlParams)
    Add-JrnlEntryToFile -Note $NoteJrnl
    return $NoteJrnl
}
