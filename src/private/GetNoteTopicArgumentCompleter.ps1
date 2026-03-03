Register-ArgumentCompleter -CommandName Get-Note -ParameterName Topic -ScriptBlock {
    param (
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters )

    $commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters | Out-Null
    $Year = if ($fakeBoundParameters.ContainsKey('Year')) { $fakeBoundParameters['Year'] } else { (Get-Date).Year }
    $PathFile = Get-NotesFile -Year $Year
    $rawData = Get-Content -Path $PathFile -ErrorAction SilentlyContinue
    $rawData | ForEach-Object { ($_ | ConvertFrom-Json).Topic } |
        Where-Object { $_ -and $_ -like "$wordToComplete*" } |
        Sort-Object -Unique
}
