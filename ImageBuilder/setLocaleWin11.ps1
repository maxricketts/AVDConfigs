# Set home location to UK
Set-WinHomeLocation 0xf2
# Override Language list with GB
$1 = New-WinUserLanguageList en-GB
Start-Sleep -s 2
$1[0].Handwriting = 1
Start-Sleep -s 2
Set-WinUserLanguageList $1 -force
Start-Sleep -s 2
# Set the System Locale
Set-WinSystemLocale en-GB
# Set the timezone
Set-TimeZone "GMT Standard Time"
# Copy settings to New Users and Welcome Screen
Copy-UserInternationalSettingsToSystem -WelcomeScreen $true -NewUser $true