enum Priority {
    Low
    Medium
    High
}

class Note {
    [string]     $ID
    [string]     $Body
    [string]     $Topic
    [datetime]   $Date
    [Priority]   $Priority

    Note([string] $Body, [string] $Topic, [Priority] $Priority) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $Body
        $this.Topic = $Topic
        $this.Priority = $Priority
        $this.Date = (Get-Date)
    }

    Note([string] $Body, [string] $Topic) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $Body
        $this.Topic = $Topic
        $this.Priority = [Priority]::Low
        $this.Date = (Get-Date)
    }

    Note([string] $Body) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $Body
        $this.Topic = 'DailyNote'
        $this.Priority = [Priority]::Low
        $this.Date = (Get-Date)
    }

    Note([hashtable] $NoteParams) {
        $this.ID = [guid]::NewGuid().ToString()
        $this.Body = $NoteParams.Body
        $this.Topic = if ($NoteParams.ContainsKey('Topic') -and $NoteParams.Topic) { $NoteParams.Topic } else { 'DailyNote' }
        $this.Priority = if ($NoteParams.ContainsKey('Priority') -and $NoteParams.Priority) { $NoteParams.Priority } else { [Priority]::Low }
        $this.Date = (Get-Date)
    }

    [void] Print() {
        # Format: "MMM dd HH:mm:ss" e.g. "Sep 12 13:02:05"
        $timestamp = $this.Date.ToString('MMM-dd HH:mm:ss')
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
