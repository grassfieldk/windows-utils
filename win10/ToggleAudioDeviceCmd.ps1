# Define the indices of your devices
$deviceIndexSperker = 1
$deviceIndexHeadphone = 2

# Get the current default audio playback device index
$currentDeviceIndex = (Get-AudioDevice -Playback | Where-Object { $_.Default -eq "True" }).Index

Write-Host "Current device index: $currentDeviceIndex"

# Function to set the default audio playback device by index
function Set-DefaultAudioDeviceByIndex {
    param (
        [int]$deviceIndex
    )

    Set-AudioDevice -Index $deviceIndex
    Write-Host "Switched to device index $deviceIndex."
}

# Toggle the default audio playback device
if ($currentDeviceIndex -eq $deviceIndexSperker) {
    Set-DefaultAudioDeviceByIndex -deviceIndex $deviceIndexHeadphone
} else {
    Set-DefaultAudioDeviceByIndex -deviceIndex $deviceIndexSperker
}
