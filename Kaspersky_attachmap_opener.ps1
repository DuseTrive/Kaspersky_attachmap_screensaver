$ie = New-Object -ComObject "InternetExplorer.Application"
$ie.Navigate("https://cybermap.kaspersky.com/")
$ie.Visible = $true
$ie.FullScreen = $true
$screensaver = 1
Add-Type -AssemblyName System.Windows.Forms

do
{
"IEHAS started: "
"Getting First Messurements"
$p1 = [System.Windows.Forms.Cursor]::Position
Write-Output $p1.X, $p1.Y
"Getting second Messurements"
Start-Sleep -Seconds 1    # 15 minutses
$p2 = [System.Windows.Forms.Cursor]::Position
Write-Output $p2
if ($p1.X -ne $p2.X -or $p1.Y -ne $p2.Y)
    {
    "iexplore shutting Down"
    Start-Sleep -Seconds 1
    Stop-Process -Name "iexplore"
    $screensaver = 0
    }
    } while($screensaver -eq 1)