## Title:       A "google" search for windows servers in AD. Can be adapted for various patterns. Useful when you have a huge AD and you lost track of that good ol' server
## Usage:       Misc
## Author:      wolfofsparta
## Version:     1.2
## Date:        2024-02-14

# Import the ActiveDirectory module
Import-Module ActiveDirectory

$computers = Get-ADComputer -Filter 'OperatingSystem -like "*Windows Server*"' -Property Name, DistinguishedName, OperatingSystem
$selectedComputers = $computers | Select-Object Name, DistinguishedName, OperatingSystem

# Export the results to a CSV file
$selectedComputers | Export-Csv -Path "C:/Temp/windows_servers.csv" -NoTypeInformation
