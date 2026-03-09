# PowerNotes

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

PowerNotes is a lightweight, cross-platform PowerShell module for journaling and note taking in the terminal. It stores every entry as plain text (JSONL) so your notes stay readable, portable, and easy to back up.

## Features

- Fast note capture from PowerShell
- Plain text JSONL storage (one file per year)
- Optional topics and priorities with colorized output
- Simple search and filtering
- No external dependencies

## Requirements

- PowerShell 7.4+ (module targets PowerShell 7.x)
- File system access to a writable data folder

## Installation

PowerNotes is available on the PowerShell Gallery.

```powershell
Install-Module PowerNotes -Scope CurrentUser
Import-Module PowerNotes
```

## Quick Start

```powershell
# Create a note (Body is required)
New-Note -Body "Ship checklist draft"

# Create a note with topic and priority
New-Note -Body "Update release notes" -Topic "Release" -Priority High

# Get recent notes (default: last 10 from current year)
Get-Note -Count 5

# Get all notes from a year
Get-Note -Year 2024 -All

# Filter by topic
Get-Note -Topic "Release"

# Search within note bodies
Find-Note -Text "release" -Year 2024 -MaxCount 20

# Get the storage file path for the current year
Get-NotesFile
```

## Commands

- `New-Note` (`npn`) — Creates a note.
  - `-Body` (required)
  - `-Topic` (optional)
  - `-Priority` — Low | Medium | High

- `Get-Note` (`gpn`) — Lists notes.
  - `-Year`
  - `-Count`
  - `-All`
  - `-Topic`
  - `-Priority`

- `Find-Note` (`fpn`) — Searches note bodies.
  - `-Text`
  - `-Year`
  - `-MaxCount`
  - `-Priority`

- `Get-NotesFile` — Returns the JSONL file path for a given year.

All commands return PowerShell objects. Notes include `ID`, `Body`, `Topic`, `Date`, and `Priority`.

## Argument Completion

The module includes argument completers for tab-completion in interactive sessions:

| Command    | Parameter | Completes                                  |
| ---------- | --------- | ------------------------------------------ |
| `Get-Note` | `-Topic`  | Topics from the selected year's notes file |
| `Get-Note` | `-Year`   | Years that have an existing notes file     |
| `New-Note` | `-Topic`  | Topics from the current year's notes file  |

## Data Storage

Notes are stored as JSONL files, one entry per line:

```
{"ID":"...","Body":"...","Topic":"DailyNote","Date":"2026-01-17T22:58:00","Priority":1}
```

Default storage locations: 📁

- Windows: `%APPDATA%\PowerNotes`
- macOS: `~/Library/Application Support/PowerNotes`
- Linux: `$XDG_DATA_HOME/PowerNotes` or `~/.local/share/PowerNotes`

To override the location, set the `PowerNotesDir` environment variable to an existing folder.

Each year is stored in `Notes-YYYY.jsonl`. You can back up or move these files directly.

## Development

Source layout:

- `src/classes` - core types (for example, `Note` and `Priority`)
- `src/public` - exported commands
- `src/private` - internal helpers
- `src/resources` - formatting resources

If you are modifying the module, ensure the module packaging step includes these folders.

## Contributing

Pull requests and issues are welcome. Please keep changes small, focused, and well-tested. If you add new commands, update documentation and examples.

## License

MIT. See `LICENSE`.
