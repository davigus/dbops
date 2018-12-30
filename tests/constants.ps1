﻿# constants
. "$PSScriptRoot\..\internal\functions\Test-Windows.ps1"
if (Test-Path "$PSScriptRoot\constants.local.ps1") {
    Write-Verbose "tests\constants.local.ps1 found."
    . "$PSScriptRoot\constants.local.ps1"
}
else {
    $script:mssqlInstance = $env:mssql_instance
    if (Test-Windows) {
        $script:mssqlCredential = $null
    } else {
        $script:mssqlCredential = [pscredential]::new($env:mssql_login, (ConvertTo-SecureString $env:mssql_password -AsPlainText -Force))
    }
}