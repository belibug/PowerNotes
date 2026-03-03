Register-ArgumentCompleter -CommandName Get-Note -ParameterName Year -ScriptBlock {
    param (
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters )

    $commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters | Out-Null
    $NotesDir = Get-NotesDir
    Get-ChildItem -Path $NotesDir -Filter 'Notes-*.jsonl' -ErrorAction SilentlyContinue |
        ForEach-Object { $_.BaseName -replace '^Notes-' } |
        Where-Object { $_ -like "$wordToComplete*" } |
        Sort-Object
}
