Import-Module .\dist\PSJournal -Force
# . .\src\private\Jrnl_class.ps1

# $j1 = [Jrnl]::new('Funny Txt here', 'cool', 'Medium')
# $j2 = [Jrnl]::new('Funny Txt here')
# $j3 = [Jrnl]::new('Funny Txt here', 'NotSoMuch', 'High')

# $j1.Print()
# $j2.Print()
# $j3.Print()
$j1 = New-PSJNote -Body 'This is first note'
$j2 = New-PSJNote -Body 'This is second note' -Priority Medium
$j3 = New-PSJNote -Body 'This is third note' -Priority High
$j1.Print()
$j2.Print()
$j3.Print()