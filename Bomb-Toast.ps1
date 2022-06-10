$TotalSeconds = 5
$TimeLeft = $TotalSeconds

$FirstDataBinding = @{
    FirstLine = "Your Computer Will Self-Destruct in 30 Seconds. "
    SecondLine = "Please save your work"
    ThirdLine = "Fuse Lit"
    ProgressStatus = 'Fuse Progress'
    ProgressValue = $TimeLeft/$TotalSeconds
    ProgressDisplay = "$TimeLeft/$TotalSeconds"
}
New-BurntToastNotification -Text "FirstLine", "SecondLine", "ThirdLine" -UniqueIdentifier "ToastBomb" -ProgressBar $Progress -AppLogo (New-BTImage -Source 'https://freesvg.org/img/bomb.png') -DataBinding $FirstDataBinding
While($TimeLeft -ge 0){
    $DataBinding = @{
        FirstLine = "Your Computer Will Self-Destruct in 30 Seconds. "
        SecondLine = "Please save your work"
        ThirdLine = "Fuse Lit"
        ProgressStatus = 'Fuse Progress'
        ProgressValue = $TimeLeft/$TotalSeconds
        ProgressDisplay = "$TimeLeft/$TotalSeconds"
    }
    Update-BTNotification -UniqueIdentifier "ToastBomb" -DataBinding $DataBinding
    $TimeLeft = $TimeLeft - 1
    Start-Sleep -Seconds 1
    $TimeLeft
}
Start-Sleep -Seconds 1
New-BurntToastNotification -Text 'boom' -AppLogo (New-BTImage -Source 'https://thumbs.dreamstime.com/z/boom-comic-word-color-art-bubble-shape-bomb-explosion-effect-cartoon-vector-speech-sticker-boom-comic-word-color-art-bubble-179847123.jpg') -SnoozeAndDismiss
Update-BTNotification -UniqueIdentifier "ToastBomb" -DataBinding $DataBinding