# Uptime (Legacy)

A module that provides system uptime information for Windows PowerShell 5 and below.

Available on [PSGallery](https://www.powershellgallery.com/packages/Uptime). Try it out with:
```powershell
Install-Module -Name Uptime -Repository PSGallery -Scope CurrentUser
```

## Description

This is a functional duplicate to the Get-Uptime cmdlet available in PowerShell 6 and above. For Windows NT specifically, I tap into the same set of objects via WMI and CIM.

### Example 1

```powershell
Get-Uptime

Days              : 9
Hours             : 0
Minutes           : 9
Seconds           : 45
Milliseconds      : 0
Ticks             : 7781850000000
TotalDays         : 9.00677083333333
TotalHours        : 216.1625
TotalMinutes      : 12969.75
TotalSeconds      : 778185
TotalMilliseconds : 778185000
```

This will display an object whose members comprise the system uptime.

### Example 2

```powershell
Get-Uptime -Since

Tuesday, June 18, 2019 2:34:56 PM
```

This will reate a symbolic link to test.exe in the $env:USERPROFILE\bin folder. Note that $env:USERPROFILE is evaluated in the context of the caller process.

### Thanks for looking!

Have a look at the help documentation at [docs.microsoft.com](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-uptime?view=powershell-7).
