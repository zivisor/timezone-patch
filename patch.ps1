$currentTimezone = (tzutil /g)
Write-Output "Current timezone: $currentTimezone"
$timezones = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/zivisor/timezone-patch/main/timezone-maps.csv").split("`n")
Write-Output "Get list timezones: success"
$timezone = (Invoke-RestMethod -Uri "https://worldtimeapi.org/api/ip/").timezone
Write-Output "Get current timezone: $timezone"
$tzline = $timezones | Where-Object {$_ -match $timezone}
Write-Output "Get timezone line: $tzline"
if ($tzline -ne $null) {
    $timezoneSelected = $tzline.split(",")[0]
    Write-Output "New timezone: $timezoneSelected"
    tzutil /s $timezoneSelected
    Write-Output "Change timezone: success"
}
Pause
