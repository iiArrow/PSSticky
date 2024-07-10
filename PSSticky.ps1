$host.ui.RawUI.WindowTitle = "PSSticky"
$title = @"
______  _____ _____ _   _      _          
| ___ \/  ___/  ___| | (_)    | |         
| |_/ /\ `--.\ `--.| |_ _  ___| | ___   _ 
|  __/  `--. \`--. \ __| |/ __| |/ / | | |
| |    /\__/ /\__/ / |_| | (__|   <| |_| |
\_|    \____/\____/ \__|_|\___|_|\_\\__, |
                                     __/ |
                                    |___/ 

Twitter; @0xArrow, Github; @iiArrow

"@

Write-Host $title

$modulecheck = "PSSQLite"

if (Get-InstalledModule -Name $modulecheck -ErrorAction SilentlyContinue){
    $Database = "C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\plum.sqlite"
    Invoke-SqliteQuery -DataSource $Database -Query "SELECT Text FROM Note"
} else {
    write-host "$modulcheck module is not installed."
    write-host "Installing .."
    Install-Module -Name PSSQLite
}