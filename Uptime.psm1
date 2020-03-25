# Microsoft Windows Powershell Script
#
# Name: Uptime
# Version: 0.1.2.0
# Date: 2020-03-24
# Author: MMillar
# https://github.com/mmillar-bolis
# http://www.bolis.com
#
# License:
# The MIT License
# Copyright (c) 2020, The Bolis Group
#
# Description:
# Get system uptime for PowerShell releases 2 through 5.
#
# This is a functional clone of the Get-Uptime cmdlet that is available in
# PowerShell versions 6 and later. It has been tested in versions 2, and 5.1 to
# reliably provide the same output as the official cmdlet.
#
# I have added a warning for shells after version 5 to notify the user of the
# legacy status of this module, in case it clobbers over the built-in.
#

#.ExternalHelp Uptime.psm1-Help.xml
function Get-Uptime {
	[CmdletBinding(
		SupportsShouldProcess=$true
	)]
	param(
		[switch]$Since
	)
	begin {
		$Shell_Version = $PSVersionTable.PSversion.Major
		$Uptime = @()
		if ( $Shell_Version -gt 5 ) {
			Write-Warning "This is a legacy module intended for PowerShell releases prior to version 6." -WarningAction Continue
		}
	}
	process {
		if ( $Shell_Version -lt 4 ) {
			$Data_Query = Get-WmiObject -Class Win32_OperatingSystem
			$Data_Table = $Data_Query.ConvertToDateTime($Data_Query.LocalDateTime) - $Data_Query.ConvertToDateTime($Data_Query.LastBootUpTime)
		} else {
			$Data_Query = Get-CimInstance -ClassName Win32_OperatingSystem
			$Data_Table = $Data_Query.LocalDateTime - $Data_Query.LastBootUpTime
		}

		$Uptime = $Data_Table.PSObject.Copy()

	}
	end {
        if ($Since) {
			if ( $Shell_Version -lt 4 ) {
				$Data_Query.ConvertToDateTime($Data_Query.LastBootUpTime)
			} else {
				$Data_Query.LastBootUpTime
			}
		} else {
			$Uptime
		}
	}
}

New-Alias -Name 'uptime' -Value 'Get-Uptime'
