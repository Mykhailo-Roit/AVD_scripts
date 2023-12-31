[CmdletBinding()]
Param (
    [Parameter(
        Mandatory
    )]
    [System.Int32]$lang_WinHomeLocation,
    [Parameter(
        Mandatory
    )]
    [System.String[]]$lang_code

)

Write-Host "Starting Laguage settings script"

Write-Host "Set-WinHomeLocation  -GeoId  $lang_WinHomeLocation"
Set-WinHomeLocation  -GeoId  $lang_WinHomeLocation

Write-Host "Set-WinSystemLocale -SystemLocale $lang_code"
Set-WinSystemLocale -SystemLocale "$lang_code"

Write-Host "Set-Culture $lang_code"
Set-Culture "$lang_code"

Write-Host "Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True"
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True

Write-Host "Stopped Laguage settings script"
