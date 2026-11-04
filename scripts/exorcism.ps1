[CmdletBinding()]
param(
    [string]$CsvPath = (Join-Path $PSScriptRoot '..\data\ghost_hosts.csv'),
    [switch]$Apply
)

$ErrorActionPreference = 'Stop'
$requiredColumns = @('Hostname', 'IP', 'Threat', 'Severity')
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

    if ($row.Severity -notin $criticalSeverities) {
        Write-Output "SKIP $($row.Hostname): severitat $($row.Severity) no crítica."
        continue
    }

    $ruleName = "Halloweb-Isolation-$($row.Hostname)"
    if ($Apply) {
        New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Action Block -RemoteAddress $row.IP -Profile Any | Out-Null
        Write-Output "APPLIED $ruleName ($($row.IP))"
    }
    else {
        Write-Output "PLAN $ruleName ($($row.IP)); repeteix amb -Apply per aplicar."
    }
}
