<#
.Synopsis

  
.DESCRIPTION
  https://docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-extensions-customscript 

.EXAMPLE
  


#>
[CmdletBinding()]
[Alias()]

Param
(
    # License Server IP address
    [Parameter(Mandatory=$true)][string]$licenseServer,

    # License Server port
    [Parameter(Mandatory=$true)][string]$licenseServerPort,

  
)

$ActArgs = '{0} {1} --ReRegister "C:\Program Files\Java\jre1.8.0_51\bin\server\jvm.dll"' -f $licenseServer, $licenseServerPort
$Act = New-ScheduledTaskAction -Execute "VersioRM.exe" -Argument $ActArgs
Set-ScheduledTask "VersioRM" -Action $Act -User "NT AUTHORITY\LOCALSERVICE"
