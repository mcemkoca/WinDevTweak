#Requires -RunAsAdministrator

function Import-TweaksConfig {
    $path = Join-Path $PSScriptRoot '..\Config\Tweaks.psd1'
    Import-PowerShellDataFile -Path $path
}

function New-SystemRestorePoint {
    param([string]$Description = 'WinDevTweak_Backup')
    try {
        Invoke-WmiMethod -Namespace root\default -Class SystemRestore -Name CreateRestorePoint -ArgumentList $Description, 100, 7 | Out-Null
        Write-Log 'System Restore Point created successfully.' -Level Success
        return $true
    } catch {
        Write-Log "Failed to create System Restore Point: $_" -Level Error
        return $false
    }
}

function Invoke-Tweak {
    param(
        [hashtable]$Tweak,
        [System.Windows.Controls.RichTextBox]$LogBox
    )
    Write-Log "Applying: $($Tweak.Name)" -Level Info -LogBox $LogBox
    $success = $true
    foreach ($cmd in $Tweak.Commands) {
        try {
            $output = Invoke-Expression $cmd 2>&1
            if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
                throw "Exit code: $LASTEXITCODE"
            }
            if ($output) {
                Write-Log "  OUT: $output" -Level Info -LogBox $LogBox
            }
            Write-Log "  OK" -Level Success -LogBox $LogBox
        } catch {
            Write-Log "  FAIL: $_" -Level Error -LogBox $LogBox
            $success = $false
        }
    }
    return $success
}

function Write-Log {
    param(
        [string]$Message,
        [ValidateSet('Info','Success','Warning','Error')]
        [string]$Level = 'Info',
        [System.Windows.Controls.RichTextBox]$LogBox
    )
    $timestamp = Get-Date -Format 'HH:mm:ss'
    $fullMsg = "[$timestamp] $Message"
    
    if ($LogBox) {
        $LogBox.Dispatcher.Invoke([action]{
            $para = New-Object System.Windows.Documents.Paragraph
            $run = New-Object System.Windows.Documents.Run($fullMsg)
            switch ($Level) {
                'Success' { $run.Foreground = [System.Windows.Media.Brushes]::LimeGreen }
                'Warning' { $run.Foreground = [System.Windows.Media.Brushes]::Yellow }
                'Error'   { $run.Foreground = [System.Windows.Media.Brushes]::Red }
                default   { $run.Foreground = [System.Windows.Media.Brushes]::LightGray }
            }
            $para.Inlines.Add($run)
            $LogBox.Document.Blocks.Add($para)
            $LogBox.ScrollToEnd()
        })
    } else {
        switch ($Level) {
            'Success' { Write-Host $fullMsg -ForegroundColor Green }
            'Warning' { Write-Host $fullMsg -ForegroundColor Yellow }
            'Error'   { Write-Host $fullMsg -ForegroundColor Red }
            default   { Write-Host $fullMsg }
        }
    }
}
