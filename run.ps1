Import-Module .\dist\PowerNotes -Force
# . .\src\private\Note_class.ps1
# $NoteFILE = Get-PSJournalFile
# Remove-Item $NoteFILE -ErrorAction SilentlyContinue

# $j1 = [Note]::new('Funny Txt here', 'cool', 'Medium')
# $j2 = [Note]::new('Funny Txt here')
# $j3 = [Note]::new('Funny Txt here', 'NotSoMuch', 'High')

# $j1.Print()
# $j2.Print()
# $j3.Print()
# $j1 = New-PSJNote -Body 'This is low note'
# $j1 = New-PSJNote -Body 'This is low note with mention' -Priority Low
# $j2 = New-PSJNote -Body 'This is medium  note - p high 2' -Priority Medium
# $j3 = New-PSJNote -Body 'This is high note - p high 3' -Priority High
# $j1.Print()
# $j2.Print()
# $j3.Print()
Get-Note -Count 2
# Write-Host 'Conten inside file' -ForegroundColor Blue
# cat $NoteFILE