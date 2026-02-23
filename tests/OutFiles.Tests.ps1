BeforeAll {
    $ProjectInfo = Get-MTProjectInfo
    $PsFiles = Get-ChildItem -LiteralPath $ProjectInfo.OutputModuleDir -Recurse -File |
    Where-Object { $_.Extension -in '.ps1', '.psm1', '.psd1' } 
}


Describe "PowerShell parse validation ($disOutDir)" {

    It 'parses cleanly: <FullName>' -ForEach $PsFiles {
        $errors = $null
        $content = Get-Content -LiteralPath $_.FullName -Raw -ErrorAction Stop

        $null = [System.Management.Automation.PSParser]::Tokenize($content, [ref]$errors)

        $errors.Count | Should -Be 0
    }
}
