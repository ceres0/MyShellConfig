
#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

# myconfig
oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH\clean-detailed.omp.json  | Invoke-Expression
function lsc {
    Param ([int]$c = 5)
    ls | Format-Wide -Column $c -Property Name
}
Import-Module Terminal-Icons

# PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
Set-PSReadLineOption -BellStyle None