## Title:       An advanced ping test when you deal with a lot of servers. 
## Author:      The Wolf of Sparta (@wolfofsparta)
## Version:     1.2
## Date:        2024-02-12

$Computers = Get-Content "$PSScriptRoot\servers.txt"
 
forEach ($comp in $Computers) {
   if (Test-Connection -ComputerName $comp -Count 1 -Quiet) {
      $Online =  "$comp,Yes"
      $Online | Out-File -FilePath $PSScriptRoot\results.txt -Append
      Write-Host "$comp is ONLINE" -ForegroundColor Green
   }
   else {
      $Offline =  "$comp,No"
      $Offline | Out-File -FilePath $PSScriptRoot\results.txt -Append
      Write-Host "$comp is OFFLINE" -ForegroundColor Red
   }
}
