@{
    Categories = @(
        @{ Id = 'perf'; Name = 'SYSTEM PERFORMANCE & RESPONSIVENESS' }
        @{ Id = 'privacy'; Name = 'TELEMETRY & PRIVACY' }
        @{ Id = 'update'; Name = 'WINDOWS UPDATE OPTIMIZATION' }
        @{ Id = 'security'; Name = 'SECURITY & DEFENDER TWEAKS' }
        @{ Id = 'network'; Name = 'NETWORK OPTIMIZATION' }
        @{ Id = 'storage'; Name = 'STORAGE & FILE SYSTEM' }
        @{ Id = 'explorer'; Name = 'EXPLORER & UI TWEAKS' }
        @{ Id = 'services'; Name = 'SERVICES OPTIMIZATION' }
        @{ Id = 'context'; Name = 'CONTEXT MENU & FILE ASSOCIATIONS' }
        @{ Id = 'devtools'; Name = 'BONUS DEVELOPER-SPECIFIC TWEAKS' }
        @{ Id = 'cleanup'; Name = 'CLEANUP & MAINTENANCE COMMANDS (331-350)' }
        @{ Id = 'registry'; Name = 'ADVANCED REGISTRY TWEAKS (351-380)' }
        @{ Id = 'features'; Name = 'DEVELOPER TOOLS & ENVIRONMENT (381-400)' }
        @{ Id = 'final'; Name = 'FINAL OPTIMIZATIONS (401-420)' }
    )

    Tweaks = @(
        @{
            Id = 'perf-001'
            Name = 'Enabling Ultimate Performance Power Plan'
            Category = 'perf'
            Description = 'Enabling Ultimate Performance Power Plan'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'powercfg.exe -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61'
                'powercfg.exe /setactive e9a42b02-d5df-448d-aa00-03f14749eb61'
                'if ($LASTEXITCODE -ne 0) { powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c }'
            )
        }
        @{
            Id = 'perf-002'
            Name = 'Disabling Hibernation'
            Category = 'perf'
            Description = 'Disabling Hibernation'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'powercfg /hibernate off'
            )
        }
        @{
            Id = 'perf-003'
            Name = 'Disabling Fast Startup'
            Category = 'perf'
            Description = 'Disabling Fast Startup'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'perf-004'
            Name = 'Setting Processor Scheduling to Programs'
            Category = 'perf'
            Description = 'Setting Processor Scheduling to Programs'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f'
            )
        }
        @{
            Id = 'perf-005'
            Name = 'Disabling UI Animations'
            Category = 'perf'
            Description = 'Disabling UI Animations'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f'
                'reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f'
            )
        }
        @{
            Id = 'perf-006'
            Name = 'Disabling Transparency Effects'
            Category = 'perf'
            Description = 'Disabling Transparency Effects'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'perf-007'
            Name = 'Disabling Live Tiles'
            Category = 'perf'
            Description = 'Disabling Live Tiles'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'perf-008'
            Name = 'Optimizing Menu Show Delay'
            Category = 'perf'
            Description = 'Optimizing Menu Show Delay'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f'
            )
        }
        @{
            Id = 'perf-009'
            Name = 'Disabling Mouse Acceleration'
            Category = 'perf'
            Description = 'Disabling Mouse Acceleration'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f'
                'reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f'
                'reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f'
            )
        }
        @{
            Id = 'perf-010'
            Name = 'Setting Visual Effects to Best Performance'
            Category = 'perf'
            Description = 'Setting Visual Effects to Best Performance'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "2" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 2: TELEMETRY & PRIVACY'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'privacy-001'
            Name = 'Disabling Windows Telemetry'
            Category = 'privacy'
            Description = 'Disabling Windows Telemetry'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'privacy-002'
            Name = 'Disabling Connected User Experiences'
            Category = 'privacy'
            Description = 'Disabling Connected User Experiences'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableCdp" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'privacy-003'
            Name = 'Disabling Advertising ID'
            Category = 'privacy'
            Description = 'Disabling Advertising ID'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'privacy-004'
            Name = 'Disabling Cortana'
            Category = 'privacy'
            Description = 'Disabling Cortana'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'privacy-005'
            Name = 'Disabling Windows Feedback'
            Category = 'privacy'
            Description = 'Disabling Windows Feedback'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'privacy-006'
            Name = 'Disabling Location Tracking'
            Category = 'privacy'
            Description = 'Disabling Location Tracking'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'privacy-007'
            Name = 'Disabling Online Speech Recognition'
            Category = 'privacy'
            Description = 'Disabling Online Speech Recognition'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'privacy-008'
            Name = 'Disabling Ink / Typing Data Collection'
            Category = 'privacy'
            Description = 'Disabling Ink / Typing Data Collection'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'privacy-009'
            Name = 'Disabling App Launch Tracking'
            Category = 'privacy'
            Description = 'Disabling App Launch Tracking'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'privacy-010'
            Name = 'Disabling Suggested Content in Settings'
            Category = 'privacy'
            Description = 'Disabling Suggested Content in Settings'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 3: WINDOWS UPDATE OPTIMIZATION'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'update-001'
            Name = 'Setting Windows Update to Notify Only'
            Category = 'update'
            Description = 'Setting Windows Update to Notify Only'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "2" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallTime" /t REG_DWORD /d "3" /f'
            )
        }
        @{
            Id = 'update-002'
            Name = 'Disabling Auto-Reboot after Updates'
            Category = 'update'
            Description = 'Disabling Auto-Reboot after Updates'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RebootRelaunchTimeoutEnabled" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RebootRelaunchTimeout" /t REG_DWORD /d "1440" /f'
            )
        }
        @{
            Id = 'update-003'
            Name = 'Disabling Driver Updates via Windows Update'
            Category = 'update'
            Description = 'Disabling Driver Updates via Windows Update'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'update-004'
            Name = 'Disabling Preview Builds'
            Category = 'update'
            Description = 'Disabling Preview Builds'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuilds" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuildsPolicyValue" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'update-005'
            Name = 'Disabling Update Orchestrator Auto-Reboot'
            Category = 'update'
            Description = 'Disabling Update Orchestrator Auto-Reboot'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\UpdateOrchestrator" /v "RestartMode" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'update-006'
            Name = 'Setting Active Hours (09:00 - 23:00)'
            Category = 'update'
            Description = 'Setting Active Hours (09:00 - 23:00)'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursStart" /t REG_DWORD /d "9" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursEnd" /t REG_DWORD /d "23" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "SmartActiveHoursState" /t REG_DWORD /d "0" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 4: SECURITY & DEFENDER TWEAKS'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'security-001'
            Name = 'Adjusting Windows Defender Settings'
            Category = 'security'
            Description = 'Adjusting Windows Defender Settings'
            RiskLevel = 'Medium'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v "ScheduleDay" /t REG_DWORD /d "6" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v "ScheduleTime" /t REG_DWORD /d "120" /f'
            )
        }
        @{
            Id = 'security-002'
            Name = 'Disabling Automatic Sample Submission'
            Category = 'security'
            Description = 'Disabling Automatic Sample Submission'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f'
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'security-003'
            Name = 'Disabling SmartScreen'
            Category = 'security'
            Description = 'Disabling SmartScreen'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'security-004'
            Name = 'Adjusting Exploit Protection'
            Category = 'security'
            Description = 'Adjusting Exploit Protection'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'security-005'
            Name = 'Lowering UAC to minimum (for dev automation)'
            Category = 'security'
            Description = 'Lowering UAC to minimum (for dev automation)'
            RiskLevel = 'High'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'security-006'
            Name = 'Enabling Developer Mode'
            Category = 'security'
            Description = 'Enabling Developer Mode'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowAllTrustedApps" /t REG_DWORD /d "1" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 5: NETWORK OPTIMIZATION'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'network-001'
            Name = 'Disabling Nagle''s Algorithm for lower latency'
            Category = 'network'
            Description = 'Disabling Nagle''s Algorithm for lower latency'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                '$ifaces = reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" 2>$null | Where-Object { $_ -match "HKEY" }; foreach ($iface in $ifaces) { reg.exe add "$iface" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f; reg.exe add "$iface" /v "TCPNoDelay" /t REG_DWORD /d "1" /f; reg.exe add "$iface" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f }'
            )
        }
        @{
            Id = 'network-002'
            Name = 'Optimizing TCP/IP Settings'
            Category = 'network'
            Description = 'Optimizing TCP/IP Settings'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'netsh int tcp set global autotuninglevel=disabled'
                'netsh int tcp set global chimney=enabled'
                'netsh int tcp set global rss=enabled'
                'netsh int tcp set global netdma=enabled'
            )
        }
        @{
            Id = 'network-003'
            Name = 'Disabling IPv6 (reduces network overhead)'
            Category = 'network'
            Description = 'Disabling IPv6 (reduces network overhead)'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f'
            )
        }
        @{
            Id = 'network-004'
            Name = 'Disabling Network Discovery'
            Category = 'network'
            Description = 'Disabling Network Discovery'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\FDResPub" /v "Start" /t REG_DWORD /d "4" /f'
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "4" /f'
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\upnphost" /v "Start" /t REG_DWORD /d "4" /f'
            )
        }
        @{
            Id = 'network-005'
            Name = 'Optimizing DNS Cache'
            Category = 'network'
            Description = 'Optimizing DNS Cache'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableBucketSize" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableSize" /t REG_DWORD /d "384" /f'
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheEntryTtlLimit" /t REG_DWORD /d "64000" /f'
                'reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxSOACacheEntryTtlLimit" /t REG_DWORD /d "301" /f'
            )
        }
        @{
            Id = 'network-006'
            Name = 'Disabling Wi-Fi Sense'
            Category = 'network'
            Description = 'Disabling Wi-Fi Sense'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 6: STORAGE & FILE SYSTEM'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'storage-001'
            Name = 'Disabling Windows Search Indexing'
            Category = 'storage'
            Description = 'Disabling Windows Search Indexing'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingOnRemovableDrives" /t REG_DWORD /d "1" /f'
                'sc config WSearch start= disabled'
                'net stop WSearch'
            )
        }
        @{
            Id = 'storage-002'
            Name = 'Disabling SysMain (Superfetch)'
            Category = 'storage'
            Description = 'Disabling SysMain (Superfetch)'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'sc config SysMain start= disabled'
                'net stop SysMain'
            )
        }
        @{
            Id = 'storage-003'
            Name = 'Disabling Prefetch'
            Category = 'storage'
            Description = 'Disabling Prefetch'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'storage-004'
            Name = 'Enabling Large System Cache'
            Category = 'storage'
            Description = 'Enabling Large System Cache'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'storage-005'
            Name = 'Disabling Last Access Time Stamp'
            Category = 'storage'
            Description = 'Disabling Last Access Time Stamp'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'fsutil behavior set disablelastaccess 1'
            )
        }
        @{
            Id = 'storage-006'
            Name = 'Disabling 8.3 Name Creation'
            Category = 'storage'
            Description = 'Disabling 8.3 Name Creation'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'fsutil behavior set disable8dot3 1'
                'echo.'
                'echo ============================================'
                'echo  SECTION 7: EXPLORER & UI TWEAKS'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'explorer-001'
            Name = 'Enabling File Extensions and Hidden Files'
            Category = 'explorer'
            Description = 'Enabling File Extensions and Hidden Files'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'explorer-002'
            Name = 'Setting Explorer to open This PC'
            Category = 'explorer'
            Description = 'Setting Explorer to open This PC'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'explorer-003'
            Name = 'Disabling Recent Files in Quick Access'
            Category = 'explorer'
            Description = 'Disabling Recent Files in Quick Access'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f'
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'explorer-004'
            Name = 'Disabling Navigation Pane Auto-Expand'
            Category = 'explorer'
            Description = 'Disabling Navigation Pane Auto-Expand'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'explorer-005'
            Name = 'Showing Full Path in Explorer Title Bar'
            Category = 'explorer'
            Description = 'Showing Full Path in Explorer Title Bar'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'explorer-006'
            Name = 'Disabling Sticky/Filter Keys Popups'
            Category = 'explorer'
            Description = 'Disabling Sticky/Filter Keys Popups'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f'
                'reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f'
                'reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 8: SERVICES OPTIMIZATION'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'services-001'
            Name = 'Disabling unnecessary services'
            Category = 'services'
            Description = 'Disabling unnecessary services'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'sc config DiagTrack start= disabled'
                'sc config dmwappushservice start= disabled'
                'sc config diagnosticshub.standardcollector.service start= disabled'
                'sc config MapsBroker start= disabled'
                'sc config lfsvc start= disabled'
                'sc config SharedAccess start= disabled'
                'sc config WMPNetworkSvc start= disabled'
                'sc config XblAuthManager start= disabled'
                'sc config XblGameSave start= disabled'
                'sc config XboxNetApiSvc start= disabled'
            )
        }
        @{
            Id = 'services-002'
            Name = 'Disabling more unnecessary services'
            Category = 'services'
            Description = 'Disabling more unnecessary services'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'sc config PhoneSvc start= disabled'
                'sc config WalletService start= disabled'
                'sc config icssvc start= disabled'
                'sc config WpcMonSvc start= disabled'
                'sc config RetailDemo start= disabled'
                'sc config Fax start= disabled'
                'sc config WbioSrvc start= disabled'
                'sc config SEMgrSvc start= disabled'
                'sc config SmsRouter start= disabled'
                'sc config TabletInputService start= disabled'
            )
        }
        @{
            Id = 'services-003'
            Name = 'Setting services to Manual'
            Category = 'services'
            Description = 'Setting services to Manual'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'sc config BITS start= demand'
                'sc config DoSvc start= demand'
                'sc config UsoSvc start= demand'
                'sc config WaaSMedicSvc start= demand'
                'sc config cryptsvc start= demand'
                'sc config Dnscache start= auto'
                'sc config NlaSvc start= auto'
                'sc config netprofm start= demand'
                'sc config Nsi start= auto'
                'sc config Dhcp start= auto'
                'echo.'
                'echo ============================================'
                'echo  SECTION 9: CONTEXT MENU & FILE ASSOCIATIONS'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'context-001'
            Name = 'Adding Open with Notepad to context menu'
            Category = 'context'
            Description = 'Adding Open with Notepad to context menu'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCR\*\shell\Open with Notepad" /ve /t REG_SZ /d "Open with Notepad" /f'
                'reg add "HKCR\*\shell\Open with Notepad\command" /ve /t REG_SZ /d "notepad.exe %1" /f'
            )
        }
        @{
            Id = 'context-002'
            Name = 'Adding Open CMD Here (Admin) to context menu'
            Category = 'context'
            Description = 'Adding Open CMD Here (Admin) to context menu'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCR\Directory\shell\OpenCMDAsAdmin" /ve /t REG_SZ /d "Open CMD Here (Admin)" /f'
                'reg add "HKCR\Directory\shell\OpenCMDAsAdmin" /v "Icon" /t REG_SZ /d "cmd.exe" /f'
                'reg add "HKCR\Directory\shell\OpenCMDAsAdmin\command" /ve /t REG_SZ /d "cmd.exe /s /k pushd \"%V\"" /f'
            )
        }
        @{
            Id = 'context-003'
            Name = 'Adding Copy Path to context menu'
            Category = 'context'
            Description = 'Adding Copy Path to context menu'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCR\*\shell\CopyPath" /ve /t REG_SZ /d "Copy Path" /f'
                'reg add "HKCR\*\shell\CopyPath\command" /ve /t REG_SZ /d "cmd.exe /c echo %1 | clip" /f'
                'reg add "HKCR\Directory\shell\CopyPath" /ve /t REG_SZ /d "Copy Path" /f'
                'reg add "HKCR\Directory\shell\CopyPath\command" /ve /t REG_SZ /d "cmd.exe /c echo %1 | clip" /f'
            )
        }
        @{
            Id = 'context-004'
            Name = 'Adding Take Ownership to context menu'
            Category = 'context'
            Description = 'Adding Take Ownership to context menu'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCR\*\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f'
                'reg add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f'
                'reg add "HKCR\*\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f'
                'reg add "HKCR\Directory\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f'
                'reg add "HKCR\Directory\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 10: BONUS DEVELOPER TWEAKS'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'devtools-001'
            Name = 'Enabling Long Path Support'
            Category = 'devtools'
            Description = 'Enabling Long Path Support'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'devtools-002'
            Name = 'Disabling Windows Error Reporting'
            Category = 'devtools'
            Description = 'Disabling Windows Error Reporting'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'devtools-003'
            Name = 'Disabling Remote Assistance'
            Category = 'devtools'
            Description = 'Disabling Remote Assistance'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f'
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'devtools-004'
            Name = 'Disabling AutoPlay'
            Category = 'devtools'
            Description = 'Disabling AutoPlay'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d "255" /f'
                'reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'devtools-005'
            Name = 'Disabling Lock Screen'
            Category = 'devtools'
            Description = 'Disabling Lock Screen'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'devtools-006'
            Name = 'Disabling Shake to Minimize'
            Category = 'devtools'
            Description = 'Disabling Shake to Minimize'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 11: CLEANUP & MAINTENANCE'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'cleanup-001'
            Name = 'Cleaning Temporary Files'
            Category = 'cleanup'
            Description = 'Cleaning Temporary Files'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'del /q /f /s %TEMP%\*.*'
                'del /q /f /s C:\Windows\Temp\*.*'
            )
        }
        @{
            Id = 'cleanup-002'
            Name = 'Flushing DNS Cache'
            Category = 'cleanup'
            Description = 'Flushing DNS Cache'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'ipconfig /flushdns'
            )
        }
        @{
            Id = 'cleanup-003'
            Name = 'Resetting Windows Store Cache'
            Category = 'cleanup'
            Description = 'Resetting Windows Store Cache'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'wsreset.exe'
            )
        }
        @{
            Id = 'cleanup-004'
            Name = 'Running Disk Cleanup'
            Category = 'cleanup'
            Description = 'Running Disk Cleanup'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'cleanmgr /sagerun:1'
                'echo.'
                'echo ============================================'
                'echo  SECTION 12: ADVANCED REGISTRY TWEAKS'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'registry-001'
            Name = 'Disabling Thumbnail Cache'
            Category = 'registry'
            Description = 'Disabling Thumbnail Cache'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'registry-002'
            Name = 'Disabling Wallpaper Compression'
            Category = 'registry'
            Description = 'Disabling Wallpaper Compression'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f'
            )
        }
        @{
            Id = 'registry-003'
            Name = 'Increasing Menu Cache Size'
            Category = 'registry'
            Description = 'Increasing Menu Cache Size'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MaxCachedIcons" /t REG_SZ /d "4096" /f'
            )
        }
        @{
            Id = 'registry-004'
            Name = 'Disabling Snap Assist'
            Category = 'registry'
            Description = 'Disabling Snap Assist'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'registry-005'
            Name = 'Disabling Timeline'
            Category = 'registry'
            Description = 'Disabling Timeline'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'registry-006'
            Name = 'Disabling Focus Assist'
            Category = 'registry'
            Description = 'Disabling Focus Assist'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d "0" /f'
                'echo.'
                'echo ============================================'
                'echo  SECTION 13: DEVELOPER TOOLS & ENVIRONMENT'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'features-001'
            Name = 'Enabling WSL'
            Category = 'features'
            Description = 'Enabling WSL'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart'
                'dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart'
            )
        }
        @{
            Id = 'features-002'
            Name = 'Enabling Hyper-V'
            Category = 'features'
            Description = 'Enabling Hyper-V'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart'
            )
        }
        @{
            Id = 'features-003'
            Name = 'Enabling Containers'
            Category = 'features'
            Description = 'Enabling Containers'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'dism.exe /online /enable-feature /featurename:Containers-DisposableClientVM /all /norestart'
            )
        }
        @{
            Id = 'features-004'
            Name = 'Enabling Windows Sandbox'
            Category = 'features'
            Description = 'Enabling Windows Sandbox'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'dism.exe /online /enable-feature /featurename:Containers-DisposableClientVM /all /norestart'
                'echo.'
                'echo ============================================'
                'echo  SECTION 14: FINAL OPTIMIZATIONS'
                'echo ============================================'
                'echo.'
            )
        }
        @{
            Id = 'final-001'
            Name = 'Final Superfetch disable'
            Category = 'final'
            Description = 'Final Superfetch disable'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBootTrace" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'final-002'
            Name = 'Optimizing Paging File'
            Category = 'final'
            Description = 'Optimizing Paging File'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f'
            )
        }
        @{
            Id = 'final-003'
            Name = 'Disabling Memory Compression'
            Category = 'final'
            Description = 'Disabling Memory Compression'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableCompression" /t REG_DWORD /d "1" /f'
            )
        }
        @{
            Id = 'final-004'
            Name = 'Restarting Explorer'
            Category = 'final'
            Description = 'Restarting Explorer'
            RiskLevel = 'Low'
            RequiresRestart = $false
            Commands = @(
                'taskkill /f /im explorer.exe'
                'start explorer.exe'
                'echo.'
                'echo ============================================'
                'echo  TWEAK COMPLETE!'
                'echo ============================================'
                'echo.'
                'echo.'
                'echo   rstrui.exe'
                'echo.'
                'echo Press any key to exit'
            )
        }
    )
}

