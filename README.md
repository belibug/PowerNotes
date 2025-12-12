## Power Notes

Data logger with simple format.

## Setup

By default jsonl (json per line) database is saved in home directory in PowerNotes sub directory. Set `env` variable `PowerNotesDir` with valid folder to change the default location. 

### Workflow

- Use `New-Note` to create note, it accepts topic (optional) and body
- Use `Get-Note` to find saved notes quickly
- Use `Find-Note` to search notes based on body or/and topic
- use `Get-NoteFile` to display file storage path for jsonl DB. This contains all the notes saved, should be used for backup/restore purposes.

All data output are powershell custom objects. 