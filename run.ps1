Import-Module .\dist\PSJournal -Force
# . .\src\private\Jrnl_class.ps1
# $JRNLFILE = Get-PSJournalFile
# Remove-Item $JRNLFILE -ErrorAction SilentlyContinue

# $j1 = [Jrnl]::new('Funny Txt here', 'cool', 'Medium')
# $j2 = [Jrnl]::new('Funny Txt here')
# $j3 = [Jrnl]::new('Funny Txt here', 'NotSoMuch', 'High')

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
Get-PSJNote -Count 2
# Write-Host 'Conten inside file' -ForegroundColor Blue
# cat $JRNLFILE