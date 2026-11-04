[CmdletBinding()]
param(
    [string]$CsvPath = (Join-Path $PSScriptRoot '..\data\ghost_hosts.csv'),
    [switch]$Apply
)

$ErrorActionPreference = 'Stop'
$requiredColumns = @('Hostname', 'IP', 'Threat', 'Severity', 'Port_Infectat')
$criticalPorts = @(22, 445, 3389)
$criticalSeverities = @('Critical', 'High')

if (-not (Test-Path -LiteralPath $CsvPath -PathType Leaf)) {
    throw "No existeix el fitxer CSV: $CsvPath"
}

$rows = @(Import-Csv -LiteralPath $CsvPath)
if ($rows.Count -eq 0) {
    Write-Output 'El diccionari no conté actius; no hi ha res a aïllar.'
    return
}

$actualColumns = @($rows[0].PSObject.Properties.Name)
$missing = @($requiredColumns | Where-Object { $_ -notin $actualColumns })
if ($missing.Count -gt 0) {
    throw "Esquema CSV invàlid. Falta: $($missing -join ', ')"
}

foreach ($row in $rows) {
    $parsedIp = $null
    if (-not [System.Net.IPAddress]::TryParse($row.IP, [ref]$parsedIp) -or
        $parsedIp.AddressFamily -ne [System.Net.Sockets.AddressFamily]::InterNetwork) {
        throw "Adreça IPv4 invàlida per a $($row.Hostname): $($row.IP)"
    }

    $port = 0
    if (-not [int]::TryParse($row.Port_Infectat, [ref]$port) -or $port -lt 1 -or $port -gt 65535) {
        Write-Output "SKIP $($row.Hostname): port buit o invàlid."
        continue
    }

    if ($port -notin $criticalPorts) {
        Write-Output "SKIP $($row.Hostname): port $port no crític."
        continue
    }

    if ($row.Severity -notin $criticalSeverities) {
        Write-Output "SKIP $($row.Hostname): severitat $($row.Severity) no crítica."
        continue
    }

    $ruleName = "Halloweb-Isolation-$($row.Hostname)-$port"
    if ($Apply) {
        New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Action Block -LocalPort $port -Protocol TCP -Profile Any | Out-Null
        Write-Output "APPLIED $ruleName (TCP/$port on $($row.Hostname); indicator IP $($row.IP))"
    }
    else {
        Write-Output "PLAN $ruleName (TCP/$port on $($row.Hostname)); repeteix amb -Apply per aplicar."
    }
}
