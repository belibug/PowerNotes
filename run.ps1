Import-Module .\dist\PSJournal -Force
# . .\src\private\Jrnl_class.ps1
$JRNLFILE = Get-PSJournalFile
Remove-Item $JRNLFILE

# $j1 = [Jrnl]::new('Funny Txt here', 'cool', 'Medium')
# $j2 = [Jrnl]::new('Funny Txt here')
# $j3 = [Jrnl]::new('Funny Txt here', 'NotSoMuch', 'High')

# $j1.Print()
# $j2.Print()
# $j3.Print()
$j1 = New-PSJNote -Body 'This is low note'
$j1 = New-PSJNote -Body 'This is low note with mention' -Priority High
$j2 = New-PSJNote -Body 'This is medium  note' -Priority High
$j3 = New-PSJNote -Body 'This is high note' -Priority High
# $j1.Print()
# $j2.Print()
# $j3.Print()
Get-PSJNote
cat $JRNLFILE