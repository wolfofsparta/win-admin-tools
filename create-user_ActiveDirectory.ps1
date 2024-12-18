## Title:       Automate AD user creation with bulk option. 
## Author:      wolfofsparta
## Version:     1.6
## Date:        2024-02-27

# Change to a directory with sufficient rights to create an Active Directory account
Set-Location -Path "C:\Temp\ADAccounts"

# Enter a path to your import CSV file storing the username, password, first name, respective OU, and the description
$ADUsers = Import-csv .\NewServiceAccounts.csv -Delimiter ","

foreach ($User in $ADUsers)
{

       $Username    = $User.username
       $Password    = $User.password
       $Firstname   = $User.firstname
       $OU          = $User.ou
       $Description = $user.description

       #Check if the user account already exists in AD
       if (Get-ADUser -F {SamAccountName -eq $Username})
       {
               #If user does exist, output a warning message
               Write-Warning "A user account $Username has already exist in Active Directory."
       }
       else
       {
        # If a user does not exist then create a new user account
        # Account will be created in the OU listed in the $OU variable in the CSV file; don’t forget to change the domain name in the"-UserPrincipalName" variable
            New-ADUser `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@myfavdomain.com" `
            -Name "$Firstname" `
            -Enabled $True `
            -DisplayName "$Firstname" `
            -Path $OU `
            -PasswordNeverExpires $true `
            -Description $Description `
            -AccountPassword (convertto-securestring $Password -AsPlainText -Force)

            Write-Warning "User $username processed."

       }
}
