oh-my-posh --init --shell pwsh --config "C:\KartikSettings\ProfilePrompt.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView