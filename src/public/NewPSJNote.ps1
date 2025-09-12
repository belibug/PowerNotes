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
    if ($null -ne $Priority) { $jrnlParams['Priority'] = $Priority }

    return [Jrnl]::new($jrnlParams)
}
