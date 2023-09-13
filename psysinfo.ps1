# Function to display the menu
function Display-Menu {
    $options = @(
        "Option 1 - View Kernel Version",
        "Option 2 - View OS Information",
        "Option 3 - View CPU Information",
        "Option 4 - View Disk Space",
        "Option 5 - View Memory Usage",
        "Option 6 - View Network Interfaces",
        "Option 7 - View System Uptime",
        "Option 8 - Clear Screen",
        "Option 9 - Quit"
    )

    while ($true) {
        Clear-Host
        Write-Host "MENU OPTIONS"
        Write-Host "------------"
        for ($i = 0; $i -lt $options.Count; $i++) {
            Write-Host ("{0}. {1}" -f ($i + 1), $options[$i])
        }

        $choice = Read-Host "Select an option (enter the number)"
        if ($choice -match '^\d+$') {
            $choice = [int]$choice
            switch ($choice) {
                1 { Get-ComputerInfo | Select-Object -ExpandProperty OsFullVersion }
                2 { Get-ComputerInfo | Select-Object -ExpandProperty OsName }
                3 { Get-WmiObject -Class Win32_Processor | Select-Object Name, MaxClockSpeed, NumberOfCores }
                4 { Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 } | Select-Object DeviceID, FreeSpace, Size }
                5 { Get-WmiObject -Class Win32_OperatingSystem | Select-Object FreePhysicalMemory, TotalVisibleMemorySize }
                6 { Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object Description, IPAddress }
                7 { Get-WmiObject -Class Win32_OperatingSystem | Select-Object LastBootUpTime }
                8 { Clear-Host }
                9 { return }
                default { Write-Host "Invalid option. Please select a valid option." }
            }
            Read-Host "Press Enter to continue..."
        }
        else {
            Write-Host "Invalid input. Please enter a number."
            Read-Host "Press Enter to continue..."
        }
    }
}

# Initial display of the menu
Display-Menu

