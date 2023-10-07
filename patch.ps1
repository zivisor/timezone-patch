$currentTimezone = (tzutil /g)
Write-Host "Current timezone: " -NoNewline; Write-Host "$currentTimezone" -ForegroundColor Green
$timezones = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/zivisor/timezone-patch/main/timezone-maps.csv").split("`n")
Write-Host "Get list timezones: " -NoNewline; Write-Host "Successfully" -ForegroundColor Green
$timezone = (Invoke-RestMethod -Uri "https://worldtimeapi.org/api/ip/").timezone
Write-Host "Get current timezone: " -NoNewline; Write-Host "$timezone" -ForegroundColor Green
$tzline = $timezones | Where-Object {$_ -match $timezone}
Write-Host "Get timezone line: " -NoNewline; Write-Host "$tzline" -ForegroundColor Green
if ($tzline) {
    $timezoneSelected = $tzline.split(",")[0]
    Write-Host "New timezone: " -NoNewline; Write-Host "$timezoneSelected" -ForegroundColor Green
    tzutil /s $timezoneSelected
    Write-Host "Change timezone: " -NoNewline; Write-Host "Successfully" -ForegroundColor Green
}else{
    Write-Host "Change timezone:" -NoNewline; Write-Host "Failed" -ForegroundColor Red
}
Pause
