enum Priority {
    Low
    Medium
    High
}

class Jrnl {
    [string]     $ID
    [string]     $Body
    [string]     $Topic
    [datetime]   $Time
    [Priority]   $Priority

    Jrnl([string] $Body, [string] $Topic, [Priority] $Priority) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $Body
        $this.Topic = $Topic
        $this.Priority = $Priority
        $this.Time = (Get-Date)
    }

    Jrnl([string] $Body, [string] $Topic) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $Body
        $this.Topic = $Topic
        $this.Priority = [Priority]::Low
        $this.Time = (Get-Date)
    }

    Jrnl([string] $Body) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $Body
        $this.Topic = 'DailyJournal'
        $this.Priority = [Priority]::Low
        $this.Time = (Get-Date)
    }

    Jrnl([hashtable] $jrnlParams) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $jrnlParams.Body
        $this.Topic = if ($jrnlParams.ContainsKey('Topic') -and $jrnlParams.Topic) { $jrnlParams.Topic } else { 'DailyJournal' }
        $this.Priority = if ($jrnlParams.ContainsKey('Priority') -and $jrnlParams.Priority) { $jrnlParams.Priority } else { [Priority]::Low }
        $this.Time = (Get-Date)
    }

    [void] Print() {
        # Format: "MMM dd HH:mm:ss" e.g. "Sep 12 13:02:05"
        $timestamp = $this.Time.ToString('MMM-dd HH:mm:ss')
        $color = $null
        switch ($this.Priority) {
            'Medium' { $color = 'Yellow' }
            'High' { $color = 'Red' }
            default { $color = $null }
        }

        # Use colon as separator between topic and body
        Write-Host ('[{0}] {1}: ' -f $timestamp, $this.Topic) -NoNewline

        if ($color) {
            Write-Host $this.Body -ForegroundColor $color
        } else {
            Write-Host $this.Body
        }
    }
}
