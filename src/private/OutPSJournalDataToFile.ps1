function Out-PSJournalDataToFile {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [Jrnl] $Note,
        [int] $Year = (Get-Date).Year
    )

    $filePath = Get-PSJournalFile -Year $Year -Create

    $list = [System.Collections.ArrayList]::new()

    try {
        $raw = Get-Content -Path $filePath -Raw -ErrorAction Stop
        if ($raw -and $raw.Trim().Length -gt 0) {
            $items = $raw | ConvertFrom-Json
            foreach ($obj in $items) {
                $e = [Jrnl]::new(@{
                        Body     = $obj.Body
                        Topic    = $obj.Topic
                        Priority = [Priority]::$($obj.Priority)
                    })
                $e.ID = $obj.ID
                $e.Time = [datetime]$obj.Time
                [void]$list.Add($e)
            }
        }
    } catch {
        Write-Error "Something went wrong: $_"
    }

    [void]$list.Add($Note)

    $json = $list | ConvertTo-Json -Depth 6
    Set-Content -Path $filePath -Value $json -Encoding UTF8
    return $list
}
