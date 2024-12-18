## Title:       My first password generator 
## Author:      The Wolf of Spart (@wolfofsparta)
## Version:     1.3
## Date:        2024-02-27

## complex version
$cont = 0
Do{
    $passwordlength = 20
    
    ## complex version
    $Chars = [Char[]]"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!#$%/()=?[]{}"

    ## simple version
    # $Chars = [Char[]]"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    
    $randomPWD = ($Chars | Get-Random -Count $passwordlenght) -join ""
    $randomPWD
    $cont = $cont + 1
}Until ($cont -eq 10)
pause
