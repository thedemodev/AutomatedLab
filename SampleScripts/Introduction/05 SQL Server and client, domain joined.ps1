#It does not get easier. These three lines install a lab with just one single Windows 10 machine.
#AL takes care about network settings like creating a virtual switch and fining a suitable IP range.

New-LabDefinition -Name 'Lab1' -DefaultVirtualizationEngine HyperV

$labSources = Get-LabSourcesLocation
Add-LabIsoImageDefinition -Name SQLServer2014 -Path $labSources\ISOs\en_sql_server_2014_standard_edition_x64_dvd_3932034.iso

#defining default parameter values, as these ones are the same for all the machines
$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:DomainName' = 'contoso.com'
    'Add-LabMachineDefinition:Memory' = 1GB
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2012 R2 SERVERDATACENTER'
}

Add-LabMachineDefinition -Name DC1 -Roles RootDC

Add-LabMachineDefinition -Name SQL1 -Roles SQLServer2014

Add-LabMachineDefinition -Name Client1 -OperatingSystem 'Windows 10 Pro'

Install-Lab

Show-LabInstallationTime