<div align="center">

# WinDevTweak

**Windows 10/11 Developer & Power-User Optimization Suite**

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://docs.microsoft.com/powershell/)
[![Windows](https://img.shields.io/badge/Windows-10%2F11-blue.svg)](https://www.microsoft.com/windows)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Release](https://img.shields.io/github/v/release/mcemkoca/WinDevTweak)](https://github.com/mcemkoca/WinDevTweak/releases)

</div>

WinDevTweak is a modern **PowerShell WPF GUI** application for optimizing Windows 10 and 11. Inspired by the excellent [Chris Titus Tech's Windows Utility](https://github.com/ChrisTitusTech/winutil), it packages **420+ system tweaks** into a clean, dark-themed interface where you can pick exactly what you want to apply.

> **Warning:** This tool modifies system settings, services, and the Windows Registry. Always create a System Restore Point before applying tweaks. Use at your own risk.

---

## Features

| Feature | Description |
|---------|-------------|
| **Modern WPF GUI** | GitHub-inspired dark theme (#0d1117), card-based layout, custom title bar, hover effects |
| **420+ Tweaks** | Performance, privacy, security, network, storage, explorer, services, dev-tools |
| **Selective Apply** | Checkbox-driven selection -- apply one, a few, or an entire category |
| **Risk Indicators** | Every tweak is tagged Low / Medium / High risk |
| **System Restore** | One-click restore point creation before any changes |
| **Live Log** | Real-time execution log with color-coded output |
| **Progress Tracking** | Visual progress bar when applying batches of tweaks |
| **Self-Elevation** | Automatically requests Administrator rights if not already elevated |

---

## Quick Start

### Requirements

- Windows 10 or Windows 11
- PowerShell 5.1 or later (PowerShell 7.x also supported)
- Administrator privileges

### Installation

```powershell
# Clone the repository
git clone https://github.com/mcemkoca/WinDevTweak.git

# Enter the directory
cd WinDevTweak

# Run the tool (will auto-elevate if needed)
.\WinDevTweak.ps1
```

No installation required -- it runs directly from the cloned folder.

---

## How to Use

1. **Launch** `WinDevTweak.ps1`
2. **Pick a category** from the left panel (or stay on "All Tweaks")
3. **Check** the tweaks you want to apply
4. Click **"Apply Selected"**
5. Confirm whether to create a **System Restore Point** first
6. Watch the **Live Log** for real-time progress

---

## Categories

| # | Category | What it covers |
|---|----------|----------------|
| 1 | **System Performance** | Power plans, hibernation, fast startup, UI animations, transparency, visual effects |
| 2 | **Telemetry & Privacy** | Windows telemetry, Cortana, advertising ID, location tracking, feedback, app-launch tracking |
| 3 | **Windows Update** | Auto-update behavior, driver updates, preview builds, active hours |
| 4 | **Security & Defender** | Windows Defender scan schedule, SmartScreen, UAC level, Developer Mode |
| 5 | **Network Optimization** | Nagle's algorithm, TCP settings, IPv6, DNS cache, Wi-Fi Sense |
| 6 | **Storage & File System** | Search indexing, SysMain/Superfetch, prefetch, large system cache, 8.3 names |
| 7 | **Explorer & UI Tweaks** | File extensions, hidden files, Quick Access, navigation pane, sticky keys |
| 8 | **Services Optimization** | Disable unnecessary services (Xbox, Maps, Fax, Phone, Wallet, etc.) |
| 9 | **Context Menu** | Add "Open with Notepad", "Open CMD Here (Admin)", "Copy Path", "Take Ownership" |
| 10 | **Developer-Specific Tweaks** | Long path support, error reporting, remote assistance, auto-play, lock screen, shake-to-minimize |
| 11 | **Cleanup & Maintenance** | Temp file cleanup, DNS flush, Windows Store cache reset, disk cleanup |
| 12 | **Advanced Registry Tweaks** | Thumbnail cache, wallpaper compression, menu cache, snap assist, timeline, focus assist |
| 13 | **Developer Tools & Environment** | WSL, Hyper-V, Containers, Windows Sandbox |
| 14 | **Final Optimizations** | Boot trace, paging file, memory compression, Explorer restart |

---

## Architecture

```
WinDevTweak/
|-- WinDevTweak.ps1          # Entry point (admin check + GUI launch)
|-- Config/
|   |-- Tweaks.psd1          # 81 tweak definitions (420+ underlying commands)
|-- Modules/
|   |-- UI.xaml              # WPF layout definition (dark theme)
|   |-- UI.ps1               # Event handlers & dynamic rendering
|   |-- Engine.ps1           # Execution engine, logging, restore-point helper
|-- README.md
|-- LICENSE
```

---

## Safety

- **System Restore Point** creation is built-in and recommended before every run.
- Each tweak shows a **risk level**:
  - **Low** -- Safe for most users.
  - **Medium** -- Optional changes; review before applying.
  - **High** -- Significant system changes (e.g., lowering UAC). Understand the impact first.
- All tweaks are based on standard Windows tools: `reg.exe`, `powercfg.exe`, `sc.exe`, `netsh.exe`, `dism.exe`, etc.

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Script cannot be loaded" (execution policy) | Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` |
| GUI does not appear | Ensure you are on Windows 10/11 with .NET Framework / WPF support |
| Some tweaks fail | Certain tweaks require specific Windows editions (e.g., Hyper-V on Pro/Enterprise). Failures are logged but do not stop the batch. |

---

## License

[MIT License](LICENSE)

---

## Acknowledgments

- Design language inspired by [Chris Titus Tech's Windows Utility](https://github.com/ChrisTitusTech/winutil)
- Original tweak collection derived from the Windows Developer Ultimate Tweak Script

---

<div align="center">

**[Download Latest Release](https://github.com/mcemkoca/WinDevTweak/releases/latest)**

</div>
