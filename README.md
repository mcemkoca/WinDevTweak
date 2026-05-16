# WinDevTweak

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)
![Windows](https://img.shields.io/badge/Windows-10%2F11-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

**WinDevTweak** is a modern PowerShell WPF GUI application for Windows 10/11 optimization, inspired by [Chris Titus Tech's Windows Utility](https://github.com/ChrisTitusTech/winutil). It provides **420+ tweaks** across **14 categories** to boost performance, enhance privacy, optimize network settings, and configure developer environments.

> **Warning:** This tool modifies system settings and the Windows Registry. Use at your own risk. A System Restore Point is strongly recommended before applying any tweaks.

## Features

- **Modern WPF GUI** - Dark theme with green accent, inspired by WinUtil
- **420+ Tweaks** - System Performance, Privacy, Security, Network, Storage, Explorer, Services, Context Menu, Developer Tools, and more
- **Selective Application** - Choose individual tweaks or entire categories
- **System Restore Point** - Built-in restore point creation before applying tweaks
- **Live Execution Log** - Real-time colored logging of applied tweaks
- **One-Click Apply** - Batch apply all selected tweaks with progress tracking

## Screenshots

*(Screenshot placeholder - run the tool and capture your own!)*

## Requirements

- Windows 10 or Windows 11
- PowerShell 5.1 or later
- Administrator privileges (the script will self-elevate if not run as admin)

## Installation & Usage

1. Clone the repository:
   ```powershell
   git clone https://github.com/mcemkoca/WinDevTweak.git
   cd WinDevTweak
   ```

2. Run the main script:
   ```powershell
   .\WinDevTweak.ps1
   ```

3. Select your desired tweaks and click **Apply Selected**.

## Categories

| Category | Description |
|----------|-------------|
| System Performance | Power plans, hibernation, UI animations, visual effects |
| Telemetry & Privacy | Disable telemetry, Cortana, advertising ID, location tracking |
| Windows Update | Auto-update settings, driver updates, active hours |
| Security & Defender | Defender settings, SmartScreen, UAC, Developer Mode |
| Network Optimization | TCP tweaks, Nagle's algorithm, DNS cache, IPv6 |
| Storage & File System | Indexing, Superfetch, prefetch, 8.3 names |
| Explorer & UI Tweaks | File extensions, hidden files, quick access, sticky keys |
| Services Optimization | Disable unnecessary services (Xbox, Maps, Fax, etc.) |
| Context Menu | Add "Open with Notepad", "Take Ownership", "Copy Path" |
| Developer Tools | WSL, Hyper-V, Containers, Windows Sandbox |
| Cleanup & Maintenance | Temp files, DNS flush, Store cache, disk cleanup |
| Advanced Registry | Thumbnail cache, wallpaper compression, timeline |
| Final Optimizations | Memory compression, paging file, Explorer restart |

## License

MIT License - see [LICENSE](LICENSE) for details.

## Acknowledgments

- Inspired by [Chris Titus Tech's Windows Utility](https://github.com/ChrisTitusTech/winutil)
- Original tweak collection adapted from Windows Developer Ultimate Tweak Script
