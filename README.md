## Power Notes

`PowerNotes` is simple journal & notes taking applicaiton for command line.

Collect your thoughts in terminal using PowerShell Module. Lightweight, plain text and opensource.
Quick create entries, view, search and backup human-readable simple plain text format. 

## Quick Start

- Use `New-Note` or alias `npn` to create note and quickly create entries. Optionally it accepts Topic, Priority
- Use `Get-Note` or alias `gpn` to get saved notes
- Use `Find-Note` or `fpn` to search notes based on body or/and topic
- use `Get-NoteFile` to display file storage path for jsonl DB. This contains all the notes saved, should be used for backup/restore purposes.

All data output are powershell custom objects. 


## Setup

By default jsonl (json per line) database is saved in home directory in PowerNotes sub directory. Set `env` variable `PowerNotesDir` with valid folder to set custom location. Store database in shared folder to keep synchronized between devices. 

## Design

### Why PowerNotes

There are no shortages of journal and notes taking application. There are several terminal based notes taking app like [jrnl](https://jrnl.sh), [note](https://github.com/armandsauzay/note). But they need external application like python or gives you complicated TUI. I built this as simple alternative with zero dependency PowerShell Module. Runs on windows as standard user with built in PowerShell and Windows Terminal. 

### Plain Text Database

All notes are saved in single `jsonl` segregated into years. Edit this file using text editor of your choice, but ensure each line has valid json object. JSONL files are compact text only content that can save thousands of entries for less than 1MiB, readable on any device easily. 

### Priority

PowerNotes has 3 priority Low (1 - default), Medium (2) and High (3). Use colors supported terminals like Windows Terminal, iTerm2, Kitty etc to get rich color output for entires based on priority of notes.

### Topic

Topcics are optional heading, by default its set to `DailyNote`, provide topic to organize notes. Notes can be searched, filtered based on topics. 

## Note

This is a personal project to keep notes in simple yet powerful way. Use at your own risk. Project is completely opensource, contribution are welcome. 