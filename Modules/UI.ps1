Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$scriptPath\Engine.ps1"

$config = Import-TweaksConfig

[xml]$xaml = Get-Content "$scriptPath\UI.xaml"
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$CategoryList = $window.FindName('CategoryList')
$TweakPanel = $window.FindName('TweakPanel')
$LogBox = $window.FindName('LogBox')
$BtnSelectAll = $window.FindName('BtnSelectAll')
$BtnDeselectAll = $window.FindName('BtnDeselectAll')
$BtnRestorePoint = $window.FindName('BtnRestorePoint')
$BtnApply = $window.FindName('BtnApply')
$ProgressBar = $window.FindName('ProgressBar')

$script:Checkboxes = @{}
$SelectionLabel = $window.FindName('SelectionLabel')

# Tweak sayilarini hesapla
$tweakCounts = @{}
foreach ($t in $config.Tweaks) {
    if (-not $tweakCounts.ContainsKey($t.Category)) { $tweakCounts[$t.Category] = 0 }
    $tweakCounts[$t.Category]++
}

function Update-SelectionLabel {
    $selected = $script:Checkboxes.Values | Where-Object { $_.IsChecked -eq $true }
    $count = if ($selected) { $selected.Count } else { 0 }
    if ($SelectionLabel) {
        $SelectionLabel.Text = "$count selected"
    }
}

# Kategorileri doldur
$allItem = New-Object System.Windows.Controls.ListBoxItem
$allItem.Content = "All Tweaks  ($($config.Tweaks.Count))"
$allItem.Tag = $null
$allItem.FontWeight = 'Bold'
$CategoryList.Items.Add($allItem)

foreach ($cat in $config.Categories) {
    $item = New-Object System.Windows.Controls.ListBoxItem
    $count = $tweakCounts[$cat.Id]
    $item.Content = "$($cat.Name)  ($count)"
    $item.Tag = $cat.Id
    $CategoryList.Items.Add($item)
}

function Show-Tweaks {
    param([string]$CategoryId)
    $TweakPanel.Children.Clear()
    $script:Checkboxes.Clear()
    
    $filtered = if ($CategoryId) {
        $config.Tweaks | Where-Object { $_.Category -eq $CategoryId }
    } else {
        $config.Tweaks
    }
    
    foreach ($tweak in $filtered) {
        $border = New-Object System.Windows.Controls.Border
        $border.BorderBrush = '#3e3e42'
        $border.BorderThickness = '0,0,0,1'
        $border.Padding = '10,8'
        $border.Margin = '0,2'
        $border.Background = '#2a2a2a'
        
        $grid = New-Object System.Windows.Controls.Grid
        $grid.ColumnDefinitions.Add((New-Object System.Windows.Controls.ColumnDefinition -Property @{Width='Auto'}))
        $grid.ColumnDefinitions.Add((New-Object System.Windows.Controls.ColumnDefinition -Property @{Width='*'}))
        
        $cb = New-Object System.Windows.Controls.CheckBox
        $cb.Margin = '0,2,12,0'
        $cb.VerticalAlignment = 'Center'
        $cb.Tag = $tweak
        $cb.Add_Checked({ Update-SelectionLabel })
        $cb.Add_Unchecked({ Update-SelectionLabel })
        [void]$grid.Children.Add($cb)
        [System.Windows.Controls.Grid]::SetColumn($cb, 0)
        
        $sp = New-Object System.Windows.Controls.StackPanel
        $tbName = New-Object System.Windows.Controls.TextBlock
        $tbName.Text = $tweak.Name
        $tbName.FontWeight = 'Bold'
        $tbName.Foreground = switch ($tweak.RiskLevel) {
            'High'   { '#ff5555' }
            'Medium' { '#ffaa00' }
            default  { '#cccccc' }
        }
        $sp.Children.Add($tbName)
        
        if ($tweak.RiskLevel -ne 'Low') {
            $tbRisk = New-Object System.Windows.Controls.TextBlock
            $tbRisk.Text = "RISK: $($tweak.RiskLevel)"
            $tbRisk.Foreground = if ($tweak.RiskLevel -eq 'High') { '#ff5555' } else { '#ffaa00' }
            $tbRisk.FontSize = 10
            $tbRisk.FontWeight = 'Bold'
            $sp.Children.Add($tbRisk)
        }
        
        $tbDesc = New-Object System.Windows.Controls.TextBlock
        $tbDesc.Text = $tweak.Description
        $tbDesc.Foreground = '#888888'
        $tbDesc.FontSize = 11
        $tbDesc.TextWrapping = 'Wrap'
        $tbDesc.Margin = '0,2,0,0'
        $sp.Children.Add($tbDesc)
        
        [void]$grid.Children.Add($sp)
        [System.Windows.Controls.Grid]::SetColumn($sp, 1)
        
        $border.Child = $grid
        $TweakPanel.Children.Add($border)
        $script:Checkboxes[$tweak.Id] = $cb
    }
    Update-SelectionLabel
}

# Events
$CategoryList.Add_SelectionChanged({
    $selected = $CategoryList.SelectedItem
    if ($selected) {
        Show-Tweaks -CategoryId $selected.Tag
    }
})

$BtnSelectAll.Add_Click({ 
    foreach ($cb in $script:Checkboxes.Values) { $cb.IsChecked = $true }
})

$BtnDeselectAll.Add_Click({ 
    foreach ($cb in $script:Checkboxes.Values) { $cb.IsChecked = $false }
})

$BtnRestorePoint.Add_Click({
    $BtnRestorePoint.IsEnabled = $false
    New-SystemRestorePoint
    $BtnRestorePoint.IsEnabled = $true
})

$BtnApply.Add_Click({
    $selected = $script:Checkboxes.Values | Where-Object { $_.IsChecked -eq $true }
    if (-not $selected) {
        Write-Log 'No tweaks selected.' -Level Warning -LogBox $LogBox
        return
    }
    
    $result = [System.Windows.MessageBox]::Show(
        "You are about to apply $($selected.Count) tweak(s).`n`nCreate a System Restore Point first?",
        'WinDevTweak - Confirm',
        'YesNoCancel',
        'Question'
    )
    
    if ($result -eq 'Cancel') { return }
    if ($result -eq 'Yes') {
        New-SystemRestorePoint
    }
    
    $BtnApply.IsEnabled = $false
    $BtnSelectAll.IsEnabled = $false
    $BtnDeselectAll.IsEnabled = $false
    $ProgressBar.Visibility = 'Visible'
    $ProgressBar.Maximum = $selected.Count
    $ProgressBar.Value = 0
    
    $total = $selected.Count
    $current = 0
    foreach ($cb in $selected) {
        $current++
        $tweak = $cb.Tag
        Write-Log "[$current/$total] $($tweak.Name)" -Level Info -LogBox $LogBox
        $ok = Invoke-Tweak -Tweak $tweak -LogBox $LogBox
        if ($ok) { 
            $cb.Foreground = '#00ff88'
            $cb.IsEnabled = $false
        }
        $ProgressBar.Value = $current
    }
    
    Write-Log 'All selected tweaks processed.' -Level Success -LogBox $LogBox
    $BtnApply.IsEnabled = $true
    $BtnSelectAll.IsEnabled = $true
    $BtnDeselectAll.IsEnabled = $true
    $ProgressBar.Visibility = 'Collapsed'
})

# Init
Show-Tweaks -CategoryId $null
$CategoryList.SelectedIndex = 0
Write-Log 'WinDevTweak loaded. Select tweaks and click Apply.' -Level Info -LogBox $LogBox

[void]$window.ShowDialog()
