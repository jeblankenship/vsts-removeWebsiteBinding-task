[CmdletBinding()]
param(
    [string]$server,
    [string] $webSiteName,
    [string] $ipAddress,
    [string] $port,
    [string] $hostHeader,
    [string] $protocol
)

Import-Module "Microsoft.TeamFoundation.DistributedTask.Task.Internal"
Import-Module "Microsoft.TeamFoundation.DistributedTask.Task.Common"

Write-Verbose "Entering script $($MyInvocation.MyCommand.Name)"
Write-Verbose "Parameter Values"
$PSBoundParameters.Keys | % { Write-HOST "  ${_} = $($PSBoundParameters[$_])" }

$command = {
    param(
        [string] $webSiteName,
        [string] $ipAddress,
        [string] $port,
        [string] $hostHeader,
        [string] $protocol
    )
    Import-Module WebAdministration
    Write-Host "Remove Binding From Web Site Task: Starting..."
    $binding =  Get-WebBinding -Name $webSiteName -IPAddress $ipAddress -Port $port -HostHeader $hostHeader -Protocol $protocol
    if ( $binding){
        Write-Host "Removing binding..."
        Remove-WebBinding -Name $webSiteName -IPAddress $ipAddress -Port $port -HostHeader $hostHeader -Protocol $protocol
    } else {
        Write-Host "Binding does not exist. No changes made."
    }
    Write-Host "Remove Binding From Web Site Task: Completed."
}

Invoke-Command -ComputerName $server $command -ArgumentList $webSiteName,$ipAddress,$port,$hostHeader,$protocol