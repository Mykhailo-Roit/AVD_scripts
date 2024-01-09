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

Write-Host "Starting Language settings script"

Write-Host "Set-WinHomeLocation  -GeoId  $lang_WinHomeLocation"
Set-WinHomeLocation  -GeoId  $lang_WinHomeLocation

Write-Host "Set-WinSystemLocale -SystemLocale $lang_code"
Set-WinSystemLocale -SystemLocale "$lang_code"

Write-Host "Set-Culture $lang_code"
Set-Culture "$lang_code"

# Add an input language
Write-Host "set input languages.1"
$UserLanguageList = New-WinUserLanguageList -Language "en-US"
Write-Host "set input languages.2"
$UserLanguageList.Add("$lang_code")
Write-Host "set input languages.3"
Set-WinUserLanguageList -LanguageList $UserLanguageList -Force

Write-Host "Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True"

$ConfirmPreference = 'None'
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True
$ConfirmPreference = 'High'

Write-Host "Stopped Language settings script"
