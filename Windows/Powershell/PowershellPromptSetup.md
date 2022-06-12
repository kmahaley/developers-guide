# Windows Terminal
## Make powershell default
    - install windows terminal
    - open `settings.json`
        - hide windows powershell(because outdated): profiles -> list -> windows powershell -> hidden:true
        - make powershell default: bring powershell on top of list

## Make powershell shorthand prompt(Optional)
    - **Avoid** this if you are planning to add `Oh-My-Posh`
    - Windows terminal -> powershell -> `echo $profile`
    - either create folder/file if not present
    - make shorthand directory name: this won't work with **oh-my-posh**
    ```
    function prompt {
    $p = Split-Path -leaf -path (Get-Location)
    "$p> "
    }
    ```
    
## Interactive Powershell display using Oh-My-Posh:
    - Install fonts
        - Goto https://www.nerdfonts.com/
        - Download `Caskaydia Cove Nerd Font` -> extract -> copy fonts to `C:\Windows\Fonts\`
        - Open windows terminal -> settings -> powershell -> appearance -> select font `CaskaydiaCove NF` 
        - Open VSCode -> command palette -> Settings UI -> search font -> add `CaskaydiaCove NF` -> restart VSCode
    - Install oh-My-Posh 
        - installing "oh-My-Posh" will slow down powershell 3x times.
        - goto `https://ohmyposh.dev/` -> installation -> follow guide
            - windows terminal -> install using given command eg.`winget install JanDeDobbeleer.OhMyPosh` -> restart windows terminal
            - windows terminal -> run `oh-my-posh.exe` -> you will see colored prompt
        - Continue to follow onmyposh document -> Replace your existing prompt
            - Locate `jandedobbeleer.omp.json` 
                - at `~\AppData\Local\Programs\oh-my-posh\themes\` OR
                - search using powershell `Get-ChildItem -Path C:\ -Filter jandedobbeleer.omp.json -Recurse -ErrorAction SilentlyContinue -Force`
            - If you have existing PromptProfile saved Or you can use PromptProfile.json from this Git folder `PromptProfile.json`
                - `code $profile`. If you don't have a profile create one.
                - Later we will update profile. Check section **Powershell profile**
            - If you want to create new profile
                - Open explorer where `jandedobbeleer.omp.json` exists -> copy/paste -> rename  `PromptProfile.json`
                - Move file to friendly location. You can use this across devices
                - Open file `code PromptProfile.json` -> edit `prompt` section -> Add or remove segments from json file `https://ohmyposh.dev/docs/az`
            - Open new powershell and see the changes

## Powershell icons
    - Open powershell -> run `Install-Module -Name Terminal-Icons -Repository PSGallery`
    - `code $profile` -> add `Import-Module -Name Terminal-Icons`

## Powershell prediction
    - open powershell -> install modules, to get list prediction
        - `Install-Module -Name PSReadLine -RequiredVersion 2.2.0-beta3 -AllowPrerelease`
        - PSReadLine might have release stable version by this time. check https://www.powershellgallery.com/packages/PSReadLine
    - Open powershell profile -> add
    ```
        Set-PSReadLineOption -PredictionSource History
        Set-PSReadLineOption -PredictionViewStyle ListView
    ```
    - open powershell -> type `cd` -> you will see prediction

## Powershell profile
    - Profile will look like this
    Eg. `USER_MENTIONED_PATH == E:\User\PromptProfile.json`
    
    ```
    # oh-my-posh will slow powershell. you can comment below line for faster powershell.
    oh-my-posh --init --shell pwsh --config "{USER_MENTIONED_PATH}" | Invoke-Expression

    Import-Module -Name Terminal-Icons

    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    ```
        
# References
- https://www.youtube.com/watch?v=VT2L1SXFq9U&ab_channel=ScottHanselman
- https://ohmyposh.dev/docs/az
- https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal
