Register-ArgumentCompleter -CommandName New-Note -ParameterName Topic -ScriptBlock {
    param (
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters )

    $commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters | Out-Null
    $PathFile = Get-NotesFile
    $rawData = Get-Content -Path $PathFile -ErrorAction SilentlyContinue
    $rawData | ForEach-Object { ($_ | ConvertFrom-Json).Topic } |
    Where-Object { $_ -and $_ -like "$wordToComplete*" } |
    Sort-Object -Unique
}
